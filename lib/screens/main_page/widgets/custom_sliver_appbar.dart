import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: maxHeight,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.all(10),
        title: widget,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
            child: Icon(LineIcons.search, size: 32,))
      ],
    );
  }
}
