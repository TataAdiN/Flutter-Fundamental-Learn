import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/api_service.dart';
import '../../providers/all_restaurant_provider.dart';
import 'main_screen.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AllRestaurantProvider>(
      create: (_) => AllRestaurantProvider(
        apiService: ApiService(),
      ),
      child: MainScreen(),
    );
  }

}