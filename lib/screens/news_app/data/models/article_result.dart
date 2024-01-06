import 'article.dart';

class ArticleResult {
  String status;
  int totalResults;
  List<Article> articles;

  ArticleResult({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  ArticleResult copyWith({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) =>
      ArticleResult(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  factory ArticleResult.fromJson(Map<String, dynamic> json) => ArticleResult(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
          json["articles"].map((x) => Article.fromJson(x)).where(
                (article) =>
                    article.author != null &&
                    article.urlToImage != null &&
                    article.publishedAt != null &&
                    article.content != null,
              ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
