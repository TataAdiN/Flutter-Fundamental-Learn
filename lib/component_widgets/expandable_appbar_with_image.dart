import 'package:flutter/material.dart';

import 'hideable_sliver_appbar_title.dart';

class ExpandableAppbarWithImage extends StatelessWidget {
  const ExpandableAppbarWithImage({
    super.key,
    required this.maxHeight,
    required this.imgUrl,
    required this.title,
  });

  final double maxHeight;
  final String imgUrl, title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: Container(
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
      ),
      expandedHeight: maxHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: imgUrl,
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        collapseMode: CollapseMode.none,
        centerTitle: true,
        title: HideableSliverAppbarTitle(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
