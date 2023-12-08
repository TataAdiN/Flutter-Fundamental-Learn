import 'package:flutter/material.dart';
import 'package:monumen_submission/news_app/news_app.dart';

import 'navigations_learn/another_screen.dart';
import 'navigations_learn/navigation_learn.dart';
import 'navigations_learn/replacement_screen.dart';
import 'navigations_learn/return_data_screen.dart';
import 'navigations_learn/second_screen.dart';
import 'navigations_learn/second_screen_with_data.dart';

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
      initialRoute: '/newsApp',
      routes: {
        '/': (context) => const NavigationLearn(),
        '/newsApp': (context) => const NewsApp(),
        '/secondScreen': (context) => const SecondScreen(),
        '/secondScreenWithData': (context) => SecondScreenWithData(
            ModalRoute.of(context)?.settings.arguments as String),
        '/returnDataScreen': (context) => const ReturnDataScreen(),
        '/replacementScreen': (context) => const ReplacementScreen(),
        '/anotherScreen': (context) => const AnotherScreen(),
      },
    );
  }
}
