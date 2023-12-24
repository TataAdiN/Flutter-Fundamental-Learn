import 'custormer_review.dart';

class RestaurantMenu {
  List<Menu> foods, drinks;

  RestaurantMenu({
    required this.foods,
    required this.drinks,
  });

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) => RestaurantMenu(
        foods: json['foods']
            .map<Menu>(
              (data) => Menu.fromJson(data),
            )
            .toList(),
        drinks: json['drinks']
            .map<Menu>(
              (data) => Menu.fromJson(data),
            )
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "foods": foods
            .map(
              (data) => data.toJson(),
            )
            .toList(),
        "drinks": drinks
            .map(
              (data) => data.toJson(),
            )
            .toList(),
      };
}
