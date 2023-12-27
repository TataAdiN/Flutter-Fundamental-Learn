import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../component_widgets/expandable_appbar_with_image.dart';
import '../../component_widgets/sliver_pinned_header.dart';
import '../../data/api_service.dart';
import '../../data/enums/restaurant_result_state.dart';
import '../../data/models/restaurant.dart';
import '../../providers/restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../widgets/food_loading.dart';
import '../widgets/restaurant_menu_section.dart';

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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.sentiment_dissatisfied,
                      size: 64,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Restuarant does not exist',
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      child: const Text('Back'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              );
            } else if (provider.state == RestaurantResultState.exist) {
              Restaurant? restaurant = provider.result.restaurant;
              return buildNestedScrollView(restaurant!, screenHeight);
            }
            return Container();
          },
        ),
      ),
    );
  }

  NestedScrollView buildNestedScrollView(
      Restaurant restaurant, double screenHeight) {
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
          ),
        ];
      },
      body: CustomScrollView(
        slivers: [
          SliverPinnedHeader(
            widget: Container(
              color: Colors.white,
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
          _content(restaurant),
          SliverPinnedHeader(
            widget: Container(
              color: Colors.white,
              child: const Align(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.restaurant_sharp, size: 24),
                      SizedBox(width: 10),
                      Text(
                        "Foods",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            minHeight: 32,
            maxHeight: 32,
          ),
          RestaurantMenuSection(
            menus: restaurant.menus!.foods,
            icon: Icons.restaurant_sharp,
          ),
          SliverPinnedHeader(
            widget: Container(
              color: Colors.white,
              child: const Align(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.coffee_outlined, size: 24),
                      SizedBox(width: 10),
                      Text(
                        "Drinks",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            minHeight: 32,
            maxHeight: 32,
          ),
          RestaurantMenuSection(
            menus: restaurant.menus!.drinks,
            icon: Icons.coffee_outlined,
          ),
        ],
      ),
    );
  }

  Widget _content(Restaurant restaurant) => SliverList(
        delegate: SliverChildListDelegate(
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(LineIcons.mapMarked, size: 28),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  restaurant.city,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: RatingBarIndicator(
                rating: restaurant.rating.roundToDouble(),
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ReadMoreText(
                restaurant.description,
                textAlign: TextAlign.justify,
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                lessStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      );
}
