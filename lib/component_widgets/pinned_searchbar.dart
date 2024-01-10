import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sliver_pinned_header.dart';

class PinnedSearchBar extends StatelessWidget {
  const PinnedSearchBar({super.key, required this.onChanged, required this.width});

  final double width;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliverPinnedHeader(
      minHeight: 72,
      maxHeight: 72,
      widget: Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: width,
                    child: Align(
                      child: CupertinoSearchTextField(
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white
                        ),
                        placeholder: 'Type restaurant name here...',
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
