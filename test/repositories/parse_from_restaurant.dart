import 'package:flutter_fundamental/data/api_service.dart';
import 'package:flutter_fundamental/data/models/restaurant_result.dart';
import 'package:flutter_fundamental/data/models/search_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //api call and parsing test when restaurant is found
  test("should load 'melting pot' restaurant", () async {
    ApiService apiService = ApiService();
    RestaurantResult result = await apiService.get('rqdv5juczeskfw1e867');
    var matchRestaurant = result.restaurant!.name == 'Melting Pot';
    expect(matchRestaurant, true);
  });
  //api call and parsing test when restaurant is not found
  test("should return 'message not found'", () async {
    ApiService apiService = ApiService();
    RestaurantResult result = await apiService.get('zzzzzz');
    var notFound = result.message == 'Restaurant not found';
    expect(notFound, true);
  });
}