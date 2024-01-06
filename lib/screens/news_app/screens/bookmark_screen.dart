import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/news_app/providers/bookmark_provider.dart';
import 'package:provider/provider.dart';

import '../enums/result_state.dart';
import '../widgets/card_article.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
      ),
      body: Consumer<BookmarkProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: provider.bookmarks.length,
              itemBuilder: (context, index) {
                return CardArticle(article: provider.bookmarks[index]);
              },
            );
          } else {
            return Center(
              child: Material(
                child: Text(provider.message),
              ),
            );
          }
        },
      ),
    );
  }
}
