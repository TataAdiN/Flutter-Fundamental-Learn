import 'package:flutter/cupertino.dart';

import '../../data/models/restaurant.dart';
import '../../utils/responsive.dart';
import '../all_restaurant/widgets/restaurant_card.dart';

class RestaurantSliverList extends StatelessWidget {
  const RestaurantSliverList({
    super.key,
    required this.restaurants,
    required this.screenWidth,
  });

  final List<Restaurant> restaurants;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 8,
      ),
      sliver: SliverList.builder(
        itemCount: restaurants.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return RestaurantCard(
            onTap: () => Navigator.pushNamed(
              context,
              '/restaurant',
              arguments: restaurants[index].id,
            ),
            restaurant: restaurants[index],
            imgWidth: Responsive.adjust(
              screenSize: screenWidth,
              percentage: 20,
            ),
            imgHeight: Responsive.adjust(
              screenSize: screenWidth,
              percentage: 15,
            ),
          );
        },
      ),
    );
  }
}
