class Article {
  final String author;
  final String title;
  final String description;
  final String publishedAt;
  final String urlToImage;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.urlToImage,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? "",
      title: json['title'] ?? "No title",
      description: json['description'] ?? "",
      publishedAt: json['publishedAt'] ?? "No date available",
      urlToImage: json['urlToImage'] ?? "",
    );
  }
}