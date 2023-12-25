import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.maxHeight,
    required this.widget,
    this.isPinned = false,
    this.isCenter = false,
    this.showBackNav = false,
    this.actions,
  });
  final bool isPinned;
  final bool isCenter;
  final bool showBackNav;
  final double maxHeight;
  final Widget widget;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: isPinned,
      snap: false,
      floating: false,
      expandedHeight: maxHeight,
      elevation: 0,
      surfaceTintColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: isCenter,
        titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        title: widget,
      ),
      leading: showBackNav ? Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: EdgeInsets.zero,
            backgroundColor: Colors.orange,
            foregroundColor: Colors.deepOrangeAccent,
          ),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ) : null,
      automaticallyImplyLeading: showBackNav,
      backgroundColor: Colors.white,
      actions: actions,
    );
  }
}
