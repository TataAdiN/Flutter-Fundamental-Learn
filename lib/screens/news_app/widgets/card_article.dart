import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/news_app/providers/bookmark_provider.dart';
import 'package:flutter_fundamental/screens/news_app/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

import '../data/models/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookmarkProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(article.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                trailing: isBookmarked
                    ? IconButton(
                  icon: const Icon(Icons.bookmark),
                  color: Colors.orange,
                  onPressed: () => provider.removeBookmark(article.url),
                )
                    : IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  color: Theme.of(context).dividerColor,
                  onPressed: () => provider.addBookmark(article),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                leading: Hero(
                  tag: article.urlToImage!,
                  child: Image.network(
                    article.urlToImage!,
                    width: 100,
                  ),
                ),
                title: Text(
                  article.title,
                ),
                subtitle: Text(article.author),
                onTap: () => Navigator.pushNamed(
                  context,
                  '/news_app.detail',
                  arguments: article,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
