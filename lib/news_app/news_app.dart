import 'package:flutter/material.dart';

import 'models/article_result.dart';
import 'utils/api_service.dart';
import 'widgets/card_article.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late Future<ArticleResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder<ArticleResult>(
        future: _article,
        builder: (context, AsyncSnapshot<ArticleResult> snapshot) {
          var state = snapshot.connectionState;
          if (state == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
              ),
            );
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data?.articles[index];
                  return CardArticle(article: article!);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Material(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                ),
              );
            } else {
              return const Material(
                child: Text(''),
              );
            }
          }
        },
      ),
    );
  }
}
