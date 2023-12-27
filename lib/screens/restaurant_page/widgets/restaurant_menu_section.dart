import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/models/restaurant_category.dart';

import '../../widgets/menu_place_holder.dart';

class RestaurantMenuSection extends StatelessWidget {
  const RestaurantMenuSection({super.key, required this.icon, required this.menus});
  final List<RestaurantCategory> menus;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverGrid.count(
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        crossAxisCount: 3,
        children: menus
            .map(
              (food) => MenuPlaceHolder(
                icon: icon,
                menu: food.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
