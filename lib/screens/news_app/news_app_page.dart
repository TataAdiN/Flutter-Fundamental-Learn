import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/news_app/providers/bookmark_provider.dart';
import 'package:flutter_fundamental/screens/news_app/screens/article_web_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api_service.dart';
import 'data/models/article.dart';
import 'helpers/database_helper.dart';
import 'helpers/preferences_helper.dart';
import 'providers/news_provider.dart';
import 'providers/preferences_provider.dart';
import 'screens/article_detail.dart';
import 'screens/news_app_screen.dart';
import 'screens/settings_screen.dart';

class NewsAppPage extends StatelessWidget {
  const NewsAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => BookmarkProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: Consumer<PreferencesProvider>(builder: (context, provider, child) {
        return MaterialApp(
          title: 'News App',
          theme: provider.themeData,
          initialRoute: '/news_app',
          routes: {
            '/news_app': (context) => const NewsAppScreen(),
            '/news_app.detail': (context) => ArticleDetailScreen(
                article: ModalRoute.of(context)?.settings.arguments as Article),
            '/news_app.webview': (context) => ArticleWebView(
                url: ModalRoute.of(context)?.settings.arguments as String),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      }),
    );
  }
}
