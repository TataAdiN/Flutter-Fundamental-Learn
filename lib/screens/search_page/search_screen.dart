import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../component_widgets/pinned_searchbar.dart';
import '../../data/enums/search_result_state.dart';
import '../../providers/search_restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../../component_widgets/custom_sliver_appbar.dart';
import '../widgets/restaurant_sliver_list.dart';
import 'widgets/search_animation.dart';

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
                    Provider.of<SearchRestaurantProvider>(
                  context,
                  listen: false,
                ).searchRestaurant(queryParam),
                width: Responsive.adjust(
                  screenSize: screenWidth,
                  percentage: 100,
                ),
              ),
              Consumer<SearchRestaurantProvider>(
                builder: (
                  BuildContext context,
                  SearchRestaurantProvider provider,
                  _,
                ) {
                  if (provider.state == SearchResultState.loading) {
                    return SliverToBoxAdapter(
                      child: SearchAnimation(
                        paddingTop: Responsive.adjust(
                            screenSize: screenHeight, percentage: 10),
                      ),
                    );
                  } else if (provider.state == SearchResultState.hasData) {
                    return RestaurantSliverList(
                      restaurants: provider.result.restaurants,
                      screenWidth: screenWidth,
                    );
                  }
                  return const SliverToBoxAdapter();
                },
              ),
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
}
