import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api_service.dart';
import 'data/models/restaurant.dart';
import 'data/sqlite_service.dart';
import 'helpers/notification_helper.dart';
import 'helpers/preferences_helper.dart';
import 'providers/all_restaurant_provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/preferences_provider.dart';
import 'providers/search_restaurant_provider.dart';
import 'screens/main_screen.dart';
import 'screens/restaurant/restaurant_page.dart';
import 'screens/restaurant/restaurant_review/restaurant_review_page.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AllRestaurantProvider>(
          create: (_) => AllRestaurantProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider<SearchRestaurantProvider>(
          create: (_) => SearchRestaurantProvider(
            apiService: ApiService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(
            service: SqliteService(),
          ),
        ),
        ChangeNotifierProvider<PreferencesProvider>(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
            context: context,
          ),
        )
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Indonesian Restaurant',
            theme: provider.themeData,
            initialRoute: '/',
            routes: {
              '/': (context) => const MainScreen(),
              '/restaurant': (context) => RestaurantPage(
                    restaurantId:
                        ModalRoute.of(context)?.settings.arguments as String,
                  ),
              '/restaurant.review': (context) => RestaurantReviewPage(
                    restaurant: ModalRoute.of(context)?.settings.arguments
                        as Restaurant,
                  ),
            },
          );
        },
      ),
    );
  }
}
