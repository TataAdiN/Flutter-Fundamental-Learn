import 'package:flutter/material.dart';

import 'sliver_appbar_delegate.dart';

class SliverPinnedHeader extends StatelessWidget {
  const SliverPinnedHeader({
    super.key,
    required this.minHeight,
    required this.maxHeight,
    required this.widget,
  });
  final double minHeight, maxHeight;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: Container(
          child: widget,
        ),
      ),
    );
  }
}
