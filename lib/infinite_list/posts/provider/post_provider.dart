import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_example_1/infinite_list/posts/provider/post_state.dart';

import '../models/post.dart';

final postsProvider =
    StateNotifierProvider<InfiniteListPostNotifier, PostState>((ref) {
  return InfiniteListPostNotifier(httpClient: http.Client())..fetchPosts();
});

class InfiniteListPostNotifier extends StateNotifier<PostState> {
  final _postLimit = 20;
  final http.Client httpClient;
  Timer? _debounce;

  InfiniteListPostNotifier({required this.httpClient})
      : super(PostState(
            status: PostStatus.initial, posts: [], hasReachedMax: false));

  _fetchPosts() async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPostsFromApi();
        state = state.copyWith(
            status: PostStatus.success, posts: posts, hasReachedMax: false);
        return;
      }
      final posts = await _fetchPostsFromApi(state.posts.length);
      state = posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              posts: List.of(state.posts)..addAll(posts),
              hasReachedMax: false);
    } catch (_) {
      state = state.copyWith(status: PostStatus.failure);
    }
  }

  fetchPosts() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 100), () {
      _fetchPosts();
    });
  }

  Future<List<Post>> _fetchPostsFromApi([int startIndex = 0]) async {
    final response = await httpClient.get(Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'}));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List;
      return body
          .map((e) => Post(
              id: e['id'] as int,
              title: e['title'] as String,
              body: e['body'] as String))
          .toList();
    }
    throw Exception('error fetching posts');
  }
}
