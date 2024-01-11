import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/enums/result_state.dart';
import '../../providers/all_restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../widgets/empty_item.dart';
import '../widgets/food_loading.dart';
import '../widgets/no_internet.dart';
import '../widgets/restaurant_sliver_list.dart';
import '../../component_widgets/custom_sliver_appbar.dart';

class AllRestaurantScreen extends StatelessWidget {
  const AllRestaurantScreen({super.key});

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
              Consumer<AllRestaurantProvider>(
                builder: (context, provider, _) {
                  if (provider.state == ResultState.loading) {
                    return SliverToBoxAdapter(
                      child: FoodLoading(
                        paddingTop: Responsive.adjust(
                          screenSize: screenHeight,
                          percentage: 10,
                        ),
                      ),
                    );
                  } else if (provider.state == ResultState.hasData) {
                    return RestaurantSliverList(
                      restaurants: provider.result.restaurants,
                      screenWidth: screenWidth,
                    );
                  } else if (provider.state == ResultState.noData) {
                    return const SliverToBoxAdapter(
                      child: EmptyItem(
                        itemName: 'restaurants',
                      ),
                    );
                  } else if (provider.state == ResultState.error) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(provider.message),
                      ),
                    );
                  } else if (provider.state == ResultState.noInternet) {
                    return _noInternetAlert(context);
                  }
                  return const SliverToBoxAdapter();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _noInternetAlert(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: NoInternet(
          onRetry: () => Provider.of<AllRestaurantProvider>(
            context,
            listen: false,
          ).retry(),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, double screenHeight) =>
      CustomSliverAppBar(
        isPinned: true,
        maxHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 12,
        ),
        widget: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Indonesian Restaurants',
              textScaler: TextScaler.linear(0.8),
            ),
            Text(
              'SUPPORT UMKM',
              textScaler: TextScaler.linear(0.3),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
