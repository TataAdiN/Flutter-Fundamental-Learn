import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component_widgets/expandable_appbar_with_image.dart';
import '../../component_widgets/sliver_pinned_header.dart';
import '../../data/api_service.dart';
import '../../data/enums/restaurant_result_state.dart';
import '../../data/models/restaurant.dart';
import '../../providers/favorite_provider.dart';
import '../../providers/restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../widgets/food_loading.dart';
import '../widgets/no_internet.dart';
import 'widgets/pinned_menu_heading.dart';
import 'widgets/restaurant_content.dart';
import 'widgets/restaurant_menu_section.dart';
import 'widgets/restaurant_not_found.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Consumer<RestaurantProvider>(
          builder: (
            BuildContext context,
            RestaurantProvider provider,
            _,
          ) {
            if (provider.state == RestaurantResultState.loading) {
              return FoodLoading(
                paddingTop: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 10,
                ),
              );
            } else if (provider.state == RestaurantResultState.notExist) {
              return const RestaurantNotFound();
            } else if (provider.state == RestaurantResultState.exist) {
              Restaurant? restaurant = provider.result.restaurant;
              return _buildRestaurant(context, restaurant!, screenHeight);
            } else if (provider.state == RestaurantResultState.noInternet) {
              return NoInternet(
                onRetry: () => Provider.of<RestaurantProvider>(
                  context,
                  listen: false,
                ).retry(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  NestedScrollView _buildRestaurant(
    BuildContext context,
    Restaurant restaurant,
    double screenHeight,
  ) {
    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return [
          ExpandableAppbarWithImage(
            maxHeight: Responsive.adjust(
              screenSize: screenHeight,
              percentage: 30,
            ),
            imgUrl: ApiService.imageUrl(restaurant.pictureId),
            title: restaurant.name,
            favoriteIcon: Consumer<FavoriteProvider>(
              builder: (context, provider, child) {
                return FutureBuilder<bool>(
                  future: provider.isFavorite(restaurant.id),
                  builder: (context, snapshot) {
                    var isFavorite = snapshot.data ?? false;
                    return ElevatedButton(
                      onPressed: (){
                        if(isFavorite){
                          provider.removeFavorite(restaurant.id);
                        }else{
                          provider.addFavorite(restaurant);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.white70,
                        foregroundColor: Colors.white70,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color:
                            isFavorite ? Colors.deepOrangeAccent : Colors.grey,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ];
      },
      body: CustomScrollView(
        slivers: [
          SliverPinnedHeader(
            widget: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            minHeight: Responsive.adjust(
              screenSize: screenHeight,
              percentage: 8,
            ),
            maxHeight: Responsive.adjust(
              screenSize: screenHeight,
              percentage: 8,
            ),
          ),
          RestaurantContent(restaurant: restaurant),
          const PinnedMenuHeading(
            headingTitle: "Foods",
            icon: Icons.restaurant_sharp,
          ),
          RestaurantMenuSection(
            menus: restaurant.menus!.foods,
            icon: Icons.restaurant_sharp,
          ),
          const PinnedMenuHeading(
            headingTitle: "Drinks",
            icon: Icons.coffee_outlined,
          ),
          RestaurantMenuSection(
            menus: restaurant.menus!.drinks,
            icon: Icons.coffee_outlined,
          ),
        ],
      ),
    );
  }
}
