import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchAnimation extends StatelessWidget{
  const SearchAnimation({super.key, required this.paddingTop});
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop
      ),
      child: Column(
        children: [
          LottieBuilder.asset(
            'assets/food_search.json',
            width: 120,
            height: 120,
            animate: true,
          ),
          const Text("Looking for a suitable restaurant")
        ],
      ),
    );
  }

}