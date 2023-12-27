import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FoodLoading extends StatelessWidget{
  const FoodLoading({super.key, required this.paddingTop});

  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
      ),
      child: Center(
        child: LottieBuilder.asset(
          'assets/food_loading.json',
          width: 120,
          height: 120,
          animate: true,
        ),
      ),
    );
  }

}