import 'package:flutter/material.dart';

class EmptyRestaurant extends StatelessWidget {
  const EmptyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 52),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 32,
              ),
              SizedBox(
                height: 8,
              ),
              Text('There are no restaurants available to display.'),
            ],
          ),
        ),
      ),
    );
  }
}
