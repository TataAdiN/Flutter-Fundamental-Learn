import 'restaurant.dart';

class AllRestaurantResult {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  AllRestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  AllRestaurantResult copyWith({
    bool? error,
    String? message,
    int? count,
    List<Restaurant>? restaurants,
  }) =>
      AllRestaurantResult(
        error: error ?? this.error,
        message: message ?? this.message,
        count: count ?? this.count,
        restaurants: restaurants ?? this.restaurants,
      );

  factory AllRestaurantResult.fromJson(Map<String, dynamic> json) =>
      AllRestaurantResult(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
          json["restaurants"].map(
            (restaurant) => Restaurant.fromJson(restaurant),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(
          restaurants.map(
            (restaurant) => restaurant.toJson(),
          ),
        ),
      };
}
