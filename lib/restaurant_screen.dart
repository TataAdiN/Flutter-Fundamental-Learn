import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';

import 'models/restaurant.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                expandedHeight: 240,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      Image.network(restaurant.imgUrl, fit: BoxFit.cover),
                  collapseMode: CollapseMode.none,
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
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
                  const SizedBox(height: 20),
                  ReadMoreText(
                    restaurant.desc,
                    textAlign: TextAlign.justify,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                    lessStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
