import 'restaurant_category.dart';
import 'customer_review.dart';
import 'menus.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  List<RestaurantCategory>? categories;
  Menus? menus;
  List<CustomerReview>? customerReviews;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating,
      this.categories,
      this.menus,
      this.customerReviews});

  Restaurant copyWith({
    String? id,
    String? name,
    String? description,
    String? pictureId,
    String? city,
    double? rating,
    List<RestaurantCategory>? categories,
    Menus? menus,
    List<CustomerReview>? customerReviews,
  }) =>
      Restaurant(
          id: id ?? this.id,
          name: name ?? this.name,
          description: description ?? this.description,
          pictureId: pictureId ?? this.pictureId,
          city: city ?? this.city,
          rating: rating ?? this.rating,
          categories: categories ?? this.categories,
          menus: menus ?? this.menus,
          customerReviews: customerReviews ?? this.customerReviews);

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
        categories: (json["categories"] != null)
            ? List<RestaurantCategory>.from(
                json["categories"].map((x) => RestaurantCategory.fromJson(x)))
            : null,
        menus:
            (json["categories"] != null) ? Menus.fromJson(json["menus"]) : null,
        customerReviews: (json["categories"] != null)
            ? List<CustomerReview>.from(
                json["customerReviews"].map((x) => CustomerReview.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "menus": menus?.toJson(),
        "customerReviews":
            List<dynamic>.from(customerReviews!.map((x) => x.toJson())),
      };
}
