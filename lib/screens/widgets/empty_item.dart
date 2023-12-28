import 'package:flutter/material.dart';

class EmptyItem extends StatelessWidget {
  const EmptyItem({super.key, required this.itemName});

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 52),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.sentiment_dissatisfied,
                size: 32,
              ),
              const SizedBox(
                height: 8,
              ),
              Text('There are no $itemName available to display.'),
            ],
          ),
        ),
      ),
    );
  }
}
