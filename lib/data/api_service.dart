import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/all_restaurant_result.dart';
import 'models/search_result.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  static String imageUrl(String imageId) {
    return "$_baseUrl/images/large/$imageId";
  }

  Future<AllRestaurantResult> fetchAll() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return AllRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch all restaurant');
    }
  }

  Future<SearchResult> findByName(String name) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$name"));
    if (response.statusCode == 200) {
      return SearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search restaurant');
    }
  }
}
