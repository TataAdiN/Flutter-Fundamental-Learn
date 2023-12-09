import 'package:flutter/material.dart';
import 'package:monumen_submission/main_screen.dart';
import 'package:monumen_submission/news_app/article_webview_page.dart';
import 'package:monumen_submission/news_app/news_app.dart';

import 'flutter_ui/flutter_ui.dart';
import 'navigations_learn/another_screen.dart';
import 'navigations_learn/navigation_learn.dart';
import 'navigations_learn/replacement_screen.dart';
import 'navigations_learn/return_data_screen.dart';
import 'navigations_learn/second_screen.dart';
import 'navigations_learn/second_screen_with_data.dart';
import 'news_app/article_detail_page.dart';
import 'news_app/models/article.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/news_app': (context) => const NewsApp(),
        '/news_app.detail': (context) => ArticleDetailPage(
            article: ModalRoute.of(context)?.settings.arguments as Article),
        '/news_app.webview': (context) => ArticleWebView(
            url: ModalRoute.of(context)?.settings.arguments as String),
        '/fundamental_app': (context) => const NavigationLearn(),
        '/fundamental_app.second_screen': (context) => const SecondScreen(),
        '/fundamental_app.second_screen_data': (context) =>
            SecondScreenWithData(
                ModalRoute.of(context)?.settings.arguments as String),
        '/fundamental_app.return_data_screen': (context) =>
            const ReturnDataScreen(),
        '/fundamental_app.replacement_screen': (context) =>
            const ReplacementScreen(),
        '/fundamental_app.another_screen': (context) => const AnotherScreen(),
        '/flutter_ui': (context) => const FlutterUI(),
      },
    );
  }
}
