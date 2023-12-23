import 'package:flutter/material.dart';
import 'package:flutter_fundamental/providers/all_restaurant_provider.dart';
import 'package:provider/provider.dart';

import '../data/api_service.dart';
import 'all_restaurant_screen.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AllRestaurantProvider>(
      create: (_) => AllRestaurantProvider(
        apiService: ApiService(),
      ),
      child: const AllRestaurantScreen(),
    );
  }

}