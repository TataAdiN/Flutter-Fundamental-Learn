import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../data/enums/result_state.dart';
import '../../data/models/restaurant.dart';
import '../../providers/all_restaurant_provider.dart';
import '../../utils/responsive.dart';
import 'widgets/custom_sliver_appbar.dart';
import 'widgets/restaurant_card.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Restaurant> restaurants = [];
  List<Restaurant> persistRestaurants = [];

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
              Consumer<AllRestaurantProvider>(builder: (context, state, _) {
                if (state.state == ResultState.loading) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Responsive.adjust(
                            screenSize: screenHeight, percentage: 10),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ),
                  );
                } else if (state.state == ResultState.hasData) {
                  return _content(state.result.restaurants, screenWidth);
                } else if (state.state == ResultState.noData) {
                  return _emptyContent();
                } else if (state.state == ResultState.error) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                }
                return const SliverToBoxAdapter();
              })
            ],
          ),
        ),
      ),
    );
  }

  void _filter(String queryParam) {
    List<Restaurant> filtered = [];
    for (var item in persistRestaurants) {
      if (item.name.toLowerCase().contains(queryParam.toLowerCase())) {
        filtered.add(item);
      }
    }
  }

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

  Widget _emptyContent() => const SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: [
              Icon(Icons.sentiment_dissatisfied),
              Text('There are no restaurants available to display.'),
            ],
          ),
        ),
      );
}
