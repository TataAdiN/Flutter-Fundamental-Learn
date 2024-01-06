class Article {
  dynamic author;
  String title;
  dynamic description;
  String url;
  dynamic urlToImage;
  DateTime publishedAt;
  dynamic content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Article copyWith({
    String? author,
    String? title,
    dynamic description,
    String? url,
    dynamic urlToImage,
    DateTime? publishedAt,
    dynamic content,
  }) =>
      Article(
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "author": author,
    "title": title,
    "description": description,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}