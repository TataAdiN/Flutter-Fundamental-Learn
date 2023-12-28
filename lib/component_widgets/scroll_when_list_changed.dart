import 'package:flutter/material.dart';

class ScrollWhenListChanged extends ScrollPhysics {
  final bool shouldRetain;
  const ScrollWhenListChanged({super.parent, this.shouldRetain = true});

  @override
  ScrollWhenListChanged applyTo(ScrollPhysics? ancestor) {
    return ScrollWhenListChanged(
      parent: buildParent(ancestor),
      shouldRetain: shouldRetain,
    );
  }

  @override
  double adjustPositionForNewDimensions({
    required ScrollMetrics oldPosition,
    required ScrollMetrics newPosition,
    required bool isScrolling,
    required double velocity,
  }) {
    final position = super.adjustPositionForNewDimensions(
      oldPosition: oldPosition,
      newPosition: newPosition,
      isScrolling: isScrolling,
      velocity: velocity,
    );

    final diff = newPosition.maxScrollExtent - oldPosition.maxScrollExtent;

    if (oldPosition.pixels > oldPosition.minScrollExtent &&
        diff > 0 &&
        shouldRetain) {
      return position + diff;
    } else {
      return position;
    }
  }
}