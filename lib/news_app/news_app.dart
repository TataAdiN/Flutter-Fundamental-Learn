import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/article.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/articles.json'),
        builder: (context, snapshot) {
          final List<Article> articles = _parseArticles(snapshot.data);
          return ListView.separated(
            itemCount: articles.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1),
            itemBuilder: (context, index) {
              return _buildArticleItem(context, articles[index]);
            },
          );
        },
      ),
    );
  }

  List<Article> _parseArticles(String? json) {
    if (json == null) {
      return [];
    }
    final List parsed = jsonDecode(json);
    return parsed.map((json) => Article.fromJson(json)).toList();
  }

  Widget _buildArticleItem(BuildContext context, Article article) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Image.network(
        article.urlToImage,
        width: 100,
        errorBuilder: (ctx, error, _) => const Center(child: Icon(Icons.error)),
      ),
      title: Text(article.title),
      subtitle: Text(article.author),
    );
  }
}
