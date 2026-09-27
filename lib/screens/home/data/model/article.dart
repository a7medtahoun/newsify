class Article {
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;
  Article({
    this.author,
    required this.title,
    this.description,
    this.urlToImage,
  });

factory Article.fromJson(Map<String, dynamic> json) {
  return Article(
    author: json['author'] ?? " ",
    title: json['title'] ?? "no title",
    description: json['description'] ?? " ",
    urlToImage: json['urlToImage'] ?? " ",
  );
}
}
