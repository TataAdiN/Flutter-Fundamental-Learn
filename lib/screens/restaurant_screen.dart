import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';

import '../component_widgets/sliver_pinned_header.dart';
import '../data/models/restaurant.dart';
import '../utils/responsive.dart';

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
            return [Container()];/*[
              ExpandableAppbarWithImage(
                  maxHeight: Responsive.adjust(
                    screenSize: screenHeight,
                    percentage: 30,
                  ),
                  imgUrl: restaurant.imgUrl,
                  title: restaurant.name),
            ]*/;
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
              _content(),
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
                minHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 6,
                ),
                maxHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 6,
                ),
              ),
              /*
              RestaurantMenuSection(
                menus: restaurant.menus.foods,
                icon: Icons.restaurant_sharp,
              ),*/
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
                minHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 6,
                ),
                maxHeight: Responsive.adjust(
                  screenSize: screenHeight,
                  percentage: 6,
                ),
              ),
              /*
              RestaurantMenuSection(
                menus: restaurant.menus.drinks,
                icon: Icons.coffee_outlined,
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _content() => SliverList(
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
                'restaurant.desc',
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
