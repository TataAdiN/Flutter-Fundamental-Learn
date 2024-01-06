import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/result_state.dart';
import '../providers/news_provider.dart';
import '../widgets/card_article.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: Consumer<NewsProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrangeAccent,
              ),
            );
          } else if (state.state == ResultState.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.result.articles.length,
              itemBuilder: (context, index) {
                var article = state.result.articles[index];
                return CardArticle(article: article);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          } else if (state.state == ResultState.noData) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }
}
