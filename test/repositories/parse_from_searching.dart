import 'package:flutter_fundamental/data/api_service.dart';
import 'package:flutter_fundamental/data/models/search_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //api call and parsing test when result is list of restaurants
  test('should not empty list', () async {
    ApiService apiService = ApiService();
    SearchResult result = await apiService.findByName('kafe');
    var isNotEmpty = result.restaurants.isNotEmpty;
    expect(isNotEmpty, true);
  });
  //api call and parsing test when result is empty list of restaurants
  test('should empty list', () async {
    ApiService apiService = ApiService();
    SearchResult result = await apiService.findByName('zzzzzz');
    var isNotEmpty = result.restaurants.isEmpty;
    expect(isNotEmpty, true);
  });
}