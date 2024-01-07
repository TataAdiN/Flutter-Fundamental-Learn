import 'package:flutter_fundamental/data/api_service.dart';
import 'package:flutter_fundamental/data/models/all_restaurant_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //api call and parsing test when load all available restaurants
  test('should not empty list', () async {
    ApiService apiService = ApiService();
    AllRestaurantResult result = await apiService.fetchAll();
    var isNotEmpty = result.restaurants.isNotEmpty;
    expect(isNotEmpty, true);
  });
}