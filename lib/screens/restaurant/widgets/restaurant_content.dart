import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:readmore/readmore.dart';

import '../../../data/models/restaurant.dart';
import '../../../data/models/restaurant_category.dart';

class RestaurantContent extends StatelessWidget {
  const RestaurantContent({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    List<RestaurantCategory> categories = [];
    if (restaurant.categories != null) {
      categories = restaurant.categories!;
    }

    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(LineIcons.mapMarked, size: 24),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          restaurant.city,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: RatingBarIndicator(
                        rating: restaurant.rating.roundToDouble(),
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(
                          horizontal: 1.0,
                        ),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 16,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.insert_comment_outlined,
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text('Reviews')
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed(
                    '/restaurant.review',
                    arguments: restaurant,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Wrap(
              children: categories
                  .map(
                    (category) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(category.name),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ReadMoreText(
              restaurant.description,
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
}
