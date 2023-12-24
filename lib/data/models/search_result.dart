import 'restaurant.dart';

class SearchResult {
  bool error;
  int founded;
  List<Restaurant> restaurants;

  SearchResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  SearchResult copyWith({
    bool? error,
    int? founded,
    List<Restaurant>? restaurants,
  }) =>
      SearchResult(
        error: error ?? this.error,
        founded: founded ?? this.founded,
        restaurants: restaurants ?? this.restaurants,
      );

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    error: json["error"],
    founded: json["founded"],
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "founded": founded,
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}