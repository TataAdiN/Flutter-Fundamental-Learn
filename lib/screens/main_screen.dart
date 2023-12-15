import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../models/restaurant.dart';
import '../utils/responsive.dart';
import '../widgets/sliver_appbar_delegate.dart';

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
              _hideableAppbar(context, screenHeight),
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

  Widget _itemCard(Restaurant restaurant, double screenWidth) => InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/restaurant',
          arguments: restaurant,
        ),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Hero(
                  tag: restaurant.imgUrl,
                  child: Container(
                    height: Responsive.adjust(
                      screenSize: screenWidth,
                      percentage: 15,
                    ),
                    width: Responsive.adjust(
                      screenSize: screenWidth,
                      percentage: 20,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(restaurant.imgUrl),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      children: [
                        const Icon(LineIcons.mapMarked, size: 20),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          restaurant.city,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBarIndicator(
                      rating: restaurant.rating.roundToDouble(),
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget _pinnedHeading(double screenHeight, double screenWidth) =>
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          minHeight: Responsive.adjust(
            screenSize: screenHeight,
            percentage: 9,
          ),
          maxHeight: Responsive.adjust(
            screenSize: screenHeight,
            percentage: 9,
          ),
          child: Container(
            color: Colors.white,
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
        ),
      );

  Widget _hideableAppbar(BuildContext context, double screenHeight) =>
      SliverAppBar(
        pinned: false,
        snap: false,
        floating: false,
        expandedHeight: Responsive.adjust(
          screenSize: screenHeight,
          percentage: 15,
        ),
        elevation: 0,
        flexibleSpace: const FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: EdgeInsets.all(10),
          title: Column(
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
        ),
        backgroundColor: Colors.white,
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
