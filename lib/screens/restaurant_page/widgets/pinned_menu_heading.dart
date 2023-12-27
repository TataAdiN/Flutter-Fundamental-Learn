import 'package:flutter/material.dart';

import '../../../component_widgets/sliver_pinned_header.dart';

class PinnedMenuHeading extends StatelessWidget {
  const PinnedMenuHeading({super.key, required this.headingTitle});

  final String headingTitle;

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      widget: Container(
        color: Colors.white,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Icon(Icons.restaurant_sharp, size: 24),
                const SizedBox(width: 8),
                Text(
                  headingTitle,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      minHeight: 32,
      maxHeight: 32,
    );
  }
}
