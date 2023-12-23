import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/news_app/utils/notification_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/alarm/alarm_screen.dart';
import 'screens/alarm/services/background_service.dart';
import 'screens/main_screen.dart';
import 'screens/news_app/news_app.dart';
import 'screens/notification/detail_notification_screen.dart';
import 'screens/notification/notification_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();

  AndroidAlarmManager.initialize();
  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
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
        '/alarm': (context) => const AlarmScreen(),
        '/news_app': (context) => const NewsApp(),
      },
    );
  }
}
