class Responsive {
  static double adjust({
    required double screenSize,
    required double percentage,
  }) {
    return screenSize * (percentage / 100);
  }
}
