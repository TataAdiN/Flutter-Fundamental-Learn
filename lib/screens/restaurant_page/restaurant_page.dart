import 'package:flutter/material.dart';
import 'package:flutter_fundamental/screens/restaurant_page/restaurant_screen.dart';
import 'package:provider/provider.dart';

import '../../data/api_service.dart';
import '../../providers/restaurant_provider.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(
        apiService: ApiService(),
        restaurantId: restaurantId
      ),
      child: const RestaurantScreen(),
    );
  }
}
