import '../post/../models/post.dart';

class Posts {
  final List<Post>? posts;

  Posts({
    this.posts,
  });

  factory Posts.fromJson(List<dynamic> json) {
    return Posts(
      posts: json.map((post) => Post.fromMap(post)).toList(),
    );
  }
}
