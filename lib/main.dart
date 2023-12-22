import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/notification/helpers/notification_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/main_screen.dart';
import 'screens/notification/detail_notification_screen.dart';
import 'screens/providers/done_module_list.dart';
import 'screens/providers/provider_screen.dart';
import 'screens/notification/notification_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/provider': (context) => const ProviderScreen(),
        '/provider.done': (context) => DoneModuleListProvider(
          doneModuleList:
          ModalRoute.of(context)?.settings.arguments as List<String>,
        ),
      },
    );
  }
}
