import 'package:flutter/material.dart';

import '../../../component_widgets/sliver_pinned_header.dart';

class PinnedMenuHeading extends StatelessWidget {
  const PinnedMenuHeading({super.key, required this.headingTitle, required this.icon});

  final String headingTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      widget: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Align(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Icon(icon, size: 24),
                const SizedBox(width: 8),
                Text(
                  headingTitle,
                  style: const TextStyle(
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
