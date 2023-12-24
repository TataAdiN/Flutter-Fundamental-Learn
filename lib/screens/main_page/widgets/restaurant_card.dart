import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../data/api_service.dart';
import '../../../data/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.onTap,
    required this.restaurant,
    required this.imgWidth,
    required this.imgHeight,
  });
  final VoidCallback onTap;
  final Restaurant restaurant;
  final double imgWidth, imgHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                children: [
                  Hero(
                    tag: ApiService.imageUrl(restaurant.pictureId),
                    child: Container(
                      height: imgHeight,
                      width: imgWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              ApiService.imageUrl(restaurant.pictureId)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  RatingBarIndicator(
                    rating: restaurant.rating.roundToDouble(),
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 12,
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
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
                    Text(
                      restaurant.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
