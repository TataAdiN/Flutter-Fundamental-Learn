import 'restaurant.dart';

class RestaurantResult {
  bool error;
  String message;
  Restaurant? restaurant;

  RestaurantResult({
    required this.error,
    required this.message,
    this.restaurant,
  });

  RestaurantResult copyWith({
    bool? error,
    String? message,
    Restaurant? restaurant,
  }) =>
      RestaurantResult(
        error: error ?? this.error,
        message: message ?? this.message,
        restaurant: restaurant ?? this.restaurant,
      );

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    error: json["error"],
    message: json["message"],
    restaurant: (json["restaurant"] != null) ? Restaurant.fromJson(json["restaurant"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "restaurant": restaurant?.toJson(),
  };
}