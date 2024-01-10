import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../component_widgets/pinned_searchbar.dart';
import '../../data/enums/search_result_state.dart';
import '../../providers/search_restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../../component_widgets/custom_sliver_appbar.dart';
import '../widgets/empty_item.dart';
import '../widgets/no_internet.dart';
import '../widgets/restaurant_sliver_list.dart';
import 'widgets/search_animation.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.grey[200]
          : Theme.of(context).primaryColorDark,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness:
          (Theme.of(context).brightness == Brightness.light)
              ? Brightness.dark
              : Brightness.light,
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
                  } else if (provider.state == SearchResultState.noData) {
                    return const EmptyItem(itemName: 'restaurants',);
                  } else if (provider.state == SearchResultState.noInternet) {
                    return _noInternetAlert(context);
                  }
                  return const EmptyItem(itemName: 'restaurants',);
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
        showBackNav: false,
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

  SliverToBoxAdapter _noInternetAlert(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: NoInternet(
          onRetry: () => Provider.of<SearchRestaurantProvider>(
            context,
            listen: false,
          ).retrySearch(),
        ),
      ),
    );
  }
}
