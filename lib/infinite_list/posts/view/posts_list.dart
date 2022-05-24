import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_1/infinite_list/posts/provider/post_provider.dart';
import '../provider/post_state.dart';
import 'post_list_item.dart';

class PostsList extends ConsumerStatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends ConsumerState<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postsProvider);

    switch (state.status) {
      case PostStatus.success:
        if (state.posts.isEmpty) {
          return Center(child: Text('no posts'));
        }
        return ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return index >= state.posts.length
                ? CircularProgressIndicator()
                : PostListItem(state.posts[index]);
          },
          itemCount:
              state.hasReachedMax ? state.posts.length : state.posts.length + 1,
        );
      case PostStatus.failure:
        return Center(child: Text('failed to fetch posts'));
      default:
        return Center(child: CircularProgressIndicator());
    }
  }

  void _onScroll() {
    if (_isBottom) ref.read(postsProvider.notifier).fetchPosts();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
