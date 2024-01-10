import 'package:flutter/material.dart';

import '../../../../data/models/customer_review.dart';

class RestaurantReviewList extends StatelessWidget {
  const RestaurantReviewList({
    super.key,
    required this.reviews,
  });

  final List<CustomerReview> reviews;

  @override
  Widget build(BuildContext context) => SliverPadding(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 8,
    ),
    sliver: SliverList.builder(
      itemCount: reviews.length,
      itemBuilder: (
          BuildContext context,
          int index,
          ) {
        return Card(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviews[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(reviews[index].review),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(reviews[index].date),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}