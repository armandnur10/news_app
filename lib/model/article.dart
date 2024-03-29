class Article {
  String author;
  String title;
  String content;
  String urlToImage;
  String publishedAt;

  Article({
    required this.title,
    required this.author,
    required this.content,
    required this.urlToImage,
    required this.publishedAt,
  });
  factory Article.fromJson(Map<String, dynamic> json) => Article(
      title: json["title"] ?? "Null",
      author: json["author"] ?? "Null",
      content: json["content"] ?? "Null",
      publishedAt: json["publishedAt"] ?? "Null",
      urlToImage: json["urlToImage"] ?? "https://www.btklsby.go.id/images/placeholder/basic.png",
      );
}
