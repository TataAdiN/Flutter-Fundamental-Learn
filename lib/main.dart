import 'package:flutter/material.dart';

import 'screens/counter/counter_screen.dart';
import 'screens/main_screen.dart';
import 'screens/notification/detail_notification_screen.dart';
import 'screens/notification/notification_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Storage',
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
        '/notification': (context) => const NotificationScreen(),
        '/notification.detail': (context) => const DetailNotificationScreen(),
        '/counter': (context) => const CounterScreen(),
      },
    );
  }
}
