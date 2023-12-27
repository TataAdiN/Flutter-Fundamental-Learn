class RestaurantCategory {
  String name;

  RestaurantCategory({
    required this.name,
  });

  RestaurantCategory copyWith({
    String? name,
  }) =>
      RestaurantCategory(
        name: name ?? this.name,
      );

  factory RestaurantCategory.fromJson(Map<String, dynamic> json) => RestaurantCategory(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
