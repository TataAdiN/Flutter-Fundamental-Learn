import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/api_service.dart';
import '../../../data/models/restaurant.dart';
import '../../../providers/restaurant_review_provider.dart';
import 'restaurant_review_screen.dart';

class RestaurantReviewPage extends StatelessWidget {
  const RestaurantReviewPage({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantReviewProvider>(
      create: (_) => RestaurantReviewProvider(
        reviews: restaurant.customerReviews!,
        restaurantId: restaurant.id,
        apiService: ApiService(),
      ),
      child: RestaurantReviewScreen(
        restaurantName: restaurant.name,
      ),
    );
  }
}
