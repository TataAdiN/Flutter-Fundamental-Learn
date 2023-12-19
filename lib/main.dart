import 'package:flutter/material.dart';

import 'flutter_network/flutter_network.dart';
import 'main_screen.dart';
import 'news_app/article_detail_page.dart';
import 'news_app/article_webview_page.dart';
import 'news_app/models/article.dart';
import 'news_app/news_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fundamental Learn',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.white,
          onPrimary: Colors.black,
          secondary: Colors.orange,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/news_app': (context) => const NewsApp(),
        '/news_app.detail': (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        '/news_app.webview': (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String),
        '/flutter_network': (context) => const FlutterNetwork(),
      },
    );
  }
}
