import 'restauran_menu.dart';

class Restaurant {
  String id, name, desc, imgUrl, city;
  dynamic rating;
  RestaurantMenu menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.desc,
    required this.imgUrl,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        name: json['name'],
        desc: json['description'],
        imgUrl: json['pictureId'],
        city: json['city'],
        rating: json['rating'],
        menus: RestaurantMenu.fromJson(
          json['menus'],
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": desc,
        "pictureId": imgUrl,
        "city": city,
        "rating": rating,
        "menus": menus.toJson(),
      };
}
