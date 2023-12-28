import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../data/enums/result_state.dart';
import '../../providers/all_restaurant_provider.dart';
import '../../utils/responsive.dart';
import '../widgets/empty_item.dart';
import '../widgets/food_loading.dart';
import '../widgets/restaurant_sliver_list.dart';
import '../../component_widgets/custom_sliver_appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              Consumer<AllRestaurantProvider>(
                builder: (context, state, _) {
                  if (state.state == ResultState.loading) {
                    return SliverToBoxAdapter(
                      child: FoodLoading(
                        paddingTop: Responsive.adjust(
                          screenSize: screenHeight,
                          percentage: 10,
                        ),
                      ),
                    );
                  } else if (state.state == ResultState.hasData) {
                    return RestaurantSliverList(
                      restaurants: state.result.restaurants,
                      screenWidth: screenWidth,
                    );
                  } else if (state.state == ResultState.noData) {
                    return const EmptyItem(itemName: 'restaurants',);
                  } else if (state.state == ResultState.error) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(state.message),
                      ),
                    );
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
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/search'),
            child: const Padding(
              padding: EdgeInsets.only(right: 40, top: 5),
              child: Icon(
                LineIcons.search,
                size: 32,
              ),
            ),
          )
        ],
      );
}
