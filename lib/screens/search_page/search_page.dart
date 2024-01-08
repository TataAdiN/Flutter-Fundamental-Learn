import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/api_service.dart';
import '../../providers/search_restaurant_provider.dart';
import 'search_screen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (_) => SearchRestaurantProvider(
        apiService: ApiService(),
      ),
      child: const SearchScreen(),
    );
  }
}