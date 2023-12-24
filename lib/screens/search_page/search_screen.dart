import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../data/enums/search_result_state.dart';
import '../../data/models/restaurant.dart';
import '../../providers/search_restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../../widgets/pinned_searchbar.dart';
import '../main_page/widgets/custom_sliver_appbar.dart';
import '../main_page/widgets/restaurant_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              _appBar(context, screenHeight),
              PinnedSearchBar(
                onChanged: (String queryParam) =>
                    Provider.of<SearchRestaurantProvider>(context,
                            listen: false)
                        .searchRestaurant(queryParam),
                width: Responsive.adjust(
                  screenSize: screenWidth,
                  percentage: 100,
                ),
              ),
              Consumer<SearchRestaurantProvider>(builder: (
                BuildContext context,
                SearchRestaurantProvider provider,
                _,
              ) {
                if (provider.state == SearchResultState.loading) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Responsive.adjust(
                            screenSize: screenHeight, percentage: 10),
                      ),
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            'assets/food_search.json',
                            width: 120,
                            height: 120,
                            animate: true,
                          ),
                          const Text("Looking for a suitable restaurant")
                        ],
                      ),
                    ),
                  );
                } else if (provider.state == SearchResultState.hasData) {
                  return _content(provider.result.restaurants, screenWidth);
                }
                return const SliverToBoxAdapter(
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, double screenHeight) =>
      CustomSliverAppBar(
        isPinned: false,
        showBackNav: true,
        maxHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 16,
        ),
        widget: const Text(
          'Search Restaurant',
          textScaler: TextScaler.linear(1),
        ),
        isCenter: true,
      );

  Widget _content(List<Restaurant> restaurants, double screenWidth) =>
      SliverPadding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 5,
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
                arguments: restaurants[index],
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
