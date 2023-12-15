import 'package:flutter/material.dart';
import 'package:flutter_fundamental/utils/responsive.dart';
import 'package:flutter_fundamental/widgets/hideable_sliver_appbar_title.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';

import '../models/restaurant.dart';
import '../widgets/sliver_appbar_delegate.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.deepOrangeAccent,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                expandedHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 30,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: restaurant.imgUrl,
                    child: Image.network(
                      restaurant.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  collapseMode: CollapseMode.none,
                  centerTitle: true,
                  title: HideableSliverAppbarTitle(
                    child: Text(
                      restaurant.name,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              _pinnable(
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
              SliverList(
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
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
                        restaurant.desc,
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
              ),
              _pinnable(
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
                minHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 4,
                ),
                maxHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 4,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  crossAxisCount: 3,
                  children: restaurant.menus.foods
                      .map(
                        (food) =>
                            _menuPlaceHolder(Icons.restaurant_sharp, food.name),
                      )
                      .toList(),
                ),
              ),
              _pinnable(
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
                minHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 4,
                ),
                maxHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 4,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverGrid.count(
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  crossAxisCount: 3,
                  children: restaurant.menus.drinks
                      .map((drink) =>
                          _menuPlaceHolder(Icons.coffee_outlined, drink.name))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuPlaceHolder(IconData icon, String menu) => Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                menu,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );

  SliverPersistentHeader _pinnable(
      {required Widget widget,
      required double minHeight,
      required double maxHeight}) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: widget,
      ),
    );
  }
}
