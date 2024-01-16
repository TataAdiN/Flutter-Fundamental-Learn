import 'dart:convert';

import 'package:flutter_fundamental/data/api_service.dart';
import 'package:flutter_fundamental/data/models/restaurant_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'client.mocks.dart';

void main() {
  //api call and parsing test when restaurant is found
  test("test api and parse from json & to json - get restaurant", () async {
    var restaurantJson = {
      "error": false,
      "message": "success",
      "restaurant": {
        "id": "s1knt6za9kkfw1e867",
        "name": "Kafe Kita",
        "description":
            "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
        "city": "Gorontalo",
        "address": "Jln. Pustakawan no 9",
        "pictureId": "25",
        "categories": [
          {"name": "Sop"},
          {"name": "Modern"}
        ],
        "menus": {
          "foods": [
            {"name": "Kari kacang dan telur"},
            {"name": "Ikan teri dan roti"},
            {"name": "roket penne"},
            {"name": "Salad lengkeng"},
            {"name": "Tumis leek"},
            {"name": "Salad yuzu"},
            {"name": "Sosis squash dan mint"}
          ],
          "drinks": [
            {"name": "Jus tomat"},
            {"name": "Minuman soda"},
            {"name": "Jus apel"},
            {"name": "Jus mangga"},
            {"name": "Es krim"},
            {"name": "Kopi espresso"},
            {"name": "Jus alpukat"},
            {"name": "Coklat panas"},
            {"name": "Es kopi"},
            {"name": "Teh manis"},
            {"name": "Sirup"},
            {"name": "Jus jeruk"}
          ]
        },
        "rating": 4,
        "customerReviews": [
          {
            "name": "Ahmad",
            "review": "Tidak ada duanya!",
            "date": "13 November 2019"
          },
          {
            "name": "Arif",
            "review": "Tidak rekomendasi untuk pelajar!",
            "date": "13 November 2019"
          },
          {
            "name": "Gilang",
            "review": "Tempatnya bagus namun menurut saya masih sedikit mahal.",
            "date": "14 Agustus 2018"
          },
          {"name": "add", "review": "asad", "date": "15 Januari 2024"},
          {"name": "asu", "review": "ya asy", "date": "15 Januari 2024"}
        ]
      }
    };
    MockClient client = MockClient();
    when(
      client.get(
        Uri.parse(
            'https://restaurant-api.dicoding.dev/detail/s1knt6za9kkfw1e867'),
      ),
    ).thenAnswer(
      (_) async => http.Response(jsonEncode(restaurantJson), 200),
    );
    ApiService apiService = ApiService(client: client);
    RestaurantResult result = await apiService.get('s1knt6za9kkfw1e867');
    expect(result.restaurant!.name, 'Kafe Kita');
    var jsonRestaurant = result.restaurant!.toJson();
    expect(jsonRestaurant['name'], 'Kafe Kita');
  });
}
