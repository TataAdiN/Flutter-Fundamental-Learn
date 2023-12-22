import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'article_list_page.dart';
import 'providers/new_provider.dart';
import 'utils/api_service.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewsProvider>(
      create: (_) => NewsProvider(
        apiService: ApiService(),
      ),
      child: const ArticleListPage(),
    );
  }
}
