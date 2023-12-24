class Category {
  String name;

  Category({
    required this.name,
  });

  Category copyWith({
    String? name,
  }) =>
      Category(
        name: name ?? this.name,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
