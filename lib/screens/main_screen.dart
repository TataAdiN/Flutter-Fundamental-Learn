import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/restaurant.dart';
import '../utils/responsive.dart';
import '../widgets/sliver_pinned_header.dart';
import 'widgets/hideable_appbar.dart';
import 'widgets/restaurant_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Restaurant> restaurants = [];
  List<Restaurant> persistRestaurants = [];

  @override
  void initState() {
    super.initState();
    _getLocalData(context);
  }

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
              _pinnedHeading(screenHeight, screenWidth),
              _content(restaurants, screenWidth),
              if (restaurants.isEmpty) _emptyContent()
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
    setState(() {
      restaurants = filtered;
    });
  }

  Future<void> _getLocalData(BuildContext context) async {
    String localData = await DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json');
    dynamic jsonData = jsonDecode(localData);
    List<dynamic> jsonRestaurants = jsonData['restaurants'];
    if (jsonRestaurants.isNotEmpty) {
      for (var jsonRestaurant in jsonRestaurants) {
        Restaurant restaurant = Restaurant.fromJson(jsonRestaurant);
        restaurants.add(restaurant);
      }
    }
    persistRestaurants = restaurants;
    setState(() {});
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
            return _itemCard(restaurants[index], screenWidth);
          },
        ),
      );

  Widget _itemCard(Restaurant restaurant, double screenWidth) => RestaurantCard(
        onTap: () => Navigator.pushNamed(
          context,
          '/restaurant',
          arguments: restaurant,
        ),
        restaurant: restaurant,
        imgWidth: Responsive.adjust(
          screenSize: screenWidth,
          percentage: 20,
        ),
        imgHeight: Responsive.adjust(
          screenSize: screenWidth,
          percentage: 15,
        ),
      );

  Widget _pinnedHeading(double screenHeight, double screenWidth) =>
      SliverPinnedHeader(
        minHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 9,
        ),
        maxHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 9,
        ),
        widget: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: Responsive.adjust(
                      screenSize: screenWidth,
                      percentage: 100,
                    ),
                    child: Align(
                      child: CupertinoSearchTextField(
                        placeholder: 'Type restaurant name here...',
                        onChanged: (String queryParam) => _filter(queryParam),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _appBar(BuildContext context, double screenHeight) => HideableAppBar(
        maxHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 15,
        ),
        widget: const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
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
