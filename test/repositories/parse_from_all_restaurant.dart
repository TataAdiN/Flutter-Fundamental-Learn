import 'dart:convert';

import 'package:flutter_fundamental/data/api_service.dart';
import 'package:flutter_fundamental/data/models/all_restaurant_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'client.mocks.dart';

void main() {
  //api call and parsing test when load all available restaurants
  test('test api and parse from json & to json - all restaurant', () async {
    var jsonAllRestaurant = {
      "error": false,
      "message": "success",
      "count": 2,
      "restaurants": [
        {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2
        },
        {
          "id": "s1knt6za9kkfw1e867",
          "name": "Kafe Kita",
          "description":
              "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,",
          "pictureId": "25",
          "city": "Gorontalo",
          "rating": 4
        },
      ]
    };
    MockClient client = MockClient();
    when(
      client.get(
        Uri.parse('https://restaurant-api.dicoding.dev/list'),
      ),
    ).thenAnswer(
      (_) async => http.Response(jsonEncode(jsonAllRestaurant), 200),
    );
    ApiService apiService = ApiService(client: client);
    AllRestaurantResult result = await apiService.fetchAll();
    var isNotEmpty = result.restaurants.isNotEmpty;
    expect(isNotEmpty, true);
    var jsonRestaurant = result.restaurants[0].toJson();
    expect(jsonRestaurant['name'], 'Melting Pot');
  });
}
