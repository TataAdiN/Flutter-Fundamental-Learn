import 'dart:convert';

import 'package:flutter_fundamental/data/api_service.dart';
import 'package:flutter_fundamental/data/models/search_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'client.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  //api call and parsing test when result is list of restaurants
  test('test api and parse from json & to json - search restaurant', () async {
    var seachJson = {
      "error": false,
      "founded": 2,
      "restaurants": [
        {
          "id": "s1knt6za9kkfw1e867",
          "name": "Kafe Kita",
          "description":
              "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
          "pictureId": "25",
          "city": "Gorontalo",
          "rating": 4
        },
        {
          "id": "uewq1zg2zlskfw1e867",
          "name": "Kafein",
          "description":
              "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
          "pictureId": "15",
          "city": "Aceh",
          "rating": 4.6
        },
      ]
    };
    MockClient client = MockClient();
    when(
      client.get(
        Uri.parse('https://restaurant-api.dicoding.dev/search?q=kafe'),
      ),
    ).thenAnswer(
      (_) async => http.Response(jsonEncode(seachJson), 200),
    );
    ApiService apiService = ApiService(client: client);
    SearchResult result = await apiService.findByName('kafe');
    var isNotEmpty = result.restaurants.isNotEmpty;
    expect(isNotEmpty, true);
    var jsonRestaurant = result.restaurants[0].toJson();
    expect(jsonRestaurant['name'], 'Kafe Kita');
  });
}
