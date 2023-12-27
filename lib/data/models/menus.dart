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
    foods: List<RestaurantCategory>.from(json["foods"].map((x) => RestaurantCategory.fromJson(x))),
    drinks: List<RestaurantCategory>.from(json["drinks"].map((x) => RestaurantCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}