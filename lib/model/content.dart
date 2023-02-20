class Post {
  final String title;
  final String content;

  Post({
    required this.content,
    required this.title,
  });

  Post.fromJson({required Map<String, dynamic> json})
      : content = json["content"],
        title = json["title"];
}
