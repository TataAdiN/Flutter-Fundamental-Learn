import 'package:flutter/material.dart';

import 'data/models/restaurant.dart';
import 'screens/main_page/main_page.dart';
import 'screens/restaurant_screen.dart';
import 'screens/search_page/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indonesian Restaurant',
      theme: ThemeData(
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.deepOrangeAccent,
          selectionColor: Colors.deepOrangeAccent,
          selectionHandleColor: Colors.deepOrangeAccent,
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.deepOrangeAccent,
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/restaurant': (context) => RestaurantScreen(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
        '/search': (context) => const SearchPage(),
      },
    );
  }
}
