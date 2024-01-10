import 'package:flutter/material.dart';
import 'package:flutter_fundamental/providers/preferences_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api_service.dart';
import 'data/models/restaurant.dart';
import 'helpers/shared_preferences.dart';
import 'providers/all_restaurant_provider.dart';
import 'providers/search_restaurant_provider.dart';
import 'screens/main_screen.dart';
import 'screens/restaurant/restaurant_page.dart';
import 'screens/restaurant/restaurant_review/restaurant_review_page.dart';

void main() {
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
        ChangeNotifierProvider<PreferencesProvider>(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        )
      ],
      child: Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
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
