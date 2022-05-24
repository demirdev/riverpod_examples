import 'package:equatable/equatable.dart';

import '../models/post.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  PostState(
      {required this.status, required this.posts, required this.hasReachedMax});

  PostState copyWith(
      {PostStatus? status, List<Post>? posts, bool? hasReachedMax}) {
    return PostState(
        status: status ?? this.status,
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''PostStatus {status: $status, hasReachedMax: $hasReachedMax, posts: ${posts.length}''';
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax];
}
