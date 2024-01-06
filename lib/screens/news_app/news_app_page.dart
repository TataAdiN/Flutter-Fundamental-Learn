import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/news_app/screens/news_app_screen.dart';
import 'package:flutter_fundamental/screens/news_app/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/preferences_helper.dart';
import 'providers/preferences_provider.dart';

class NewsAppPage extends StatelessWidget {
  const NewsAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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
            '/settings': (context) => const SettingsScreen(),
          },
        );
      }),
    );
  }
}
