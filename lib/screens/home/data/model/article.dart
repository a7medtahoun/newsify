class Article {
  final String? author;
  final String title;
  final String? description;
  final String? publishedAt;
  final String? urlToImage;
  Article({
    this.author,
    required this.title,
    this.description,
    this.urlToImage, this.publishedAt,
  });

factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    author: json['author'] ?? " ",
    title: json['title'] ?? "no title",
    publishedAt: json['publishedAt'] ?? "no publishedAt",
    description: json['description'] ?? " ",
    urlToImage: json['urlToImage'] ?? " ",
  );
}
}
