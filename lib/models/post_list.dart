import '../post/../models/post.dart';

class PostList {
  final List<Post>? posts;

  PostList({
    this.posts,
  });

  factory PostList.fromJson(List<dynamic> json) {
    return PostList(
      posts: json.map((post) => Post.fromMap(post)).toList(),
    );
  }
}
