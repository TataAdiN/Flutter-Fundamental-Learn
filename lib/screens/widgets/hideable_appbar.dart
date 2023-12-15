import 'package:flutter/material.dart';

class HideableAppBar extends StatelessWidget {
  const HideableAppBar({
    super.key,
    required this.maxHeight,
    required this.widget,
  });
  final double maxHeight;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      snap: false,
      floating: false,
      expandedHeight: maxHeight,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(10),
        title: widget,
      ),
      backgroundColor: Colors.white,
    );
  }
}
