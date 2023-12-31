import 'restaurant_category.dart';

class Menus {
  List<RestaurantCategory> foods;
  List<RestaurantCategory> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  Menus copyWith({
    List<RestaurantCategory>? foods,
    List<RestaurantCategory>? drinks,
  }) =>
      Menus(
        foods: foods ?? this.foods,
        drinks: drinks ?? this.drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<RestaurantCategory>.from(
          json["foods"].map(
            (menu) => RestaurantCategory.fromJson(menu),
          ),
        ),
        drinks: List<RestaurantCategory>.from(
          json["drinks"].map(
            (menu) => RestaurantCategory.fromJson(menu),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(
          foods.map(
            (menu) => menu.toJson(),
          ),
        ),
        "drinks": List<dynamic>.from(
          drinks.map(
            (menu) => menu.toJson(),
          ),
        ),
      };
}
