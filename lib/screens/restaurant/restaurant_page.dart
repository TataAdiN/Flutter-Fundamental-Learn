import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../data/api_service.dart';
import '../../providers/restaurant_provider.dart';
import 'restaurant_screen.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(
        apiService: ApiService(client: http.Client()),
        restaurantId: restaurantId
      ),
      child: const RestaurantScreen(),
    );
  }
}
