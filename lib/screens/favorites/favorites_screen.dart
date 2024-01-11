import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/enums/result_state.dart';
import '../../providers/favorite_provider.dart';
import '../../utils/responsive.dart';
import '../all_restaurant/widgets/restaurant_card.dart';
import '../widgets/empty_item.dart';
import '../widgets/food_loading.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.grey[200]
          : Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.loading) {
            return FoodLoading(
              paddingTop: Responsive.adjust(
                screenSize: screenHeight,
                percentage: 10,
              ),
            );
          } else if (provider.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                return RestaurantCard(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/restaurant',
                    arguments: provider.favorites[index].id,
                  ),
                  restaurant: provider.favorites[index],
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
            );
          } else if (provider.state == ResultState.noData) {
            return const EmptyItem(
              itemName: 'favorite restaurants',
            );
          } else if (provider.state == ResultState.error) {
            return Center(
              child: Text(provider.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
