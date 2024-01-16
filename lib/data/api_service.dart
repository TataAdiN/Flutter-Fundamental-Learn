import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/all_restaurant_result.dart';
import 'models/customer_review.dart';
import 'models/restaurant_result.dart';
import 'models/search_result.dart';

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  static String imageUrl(String imageId) {
    return "$_baseUrl/images/large/$imageId";
  }

  Future<AllRestaurantResult> fetchAll() async {
    final response = await client.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return AllRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch all restaurant');
    }
  }

  Future<SearchResult> findByName(String name) async {
    final response = await client.get(Uri.parse("$_baseUrl/search?q=$name"));
    if (response.statusCode == 200) {
      return SearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search restaurant');
    }
  }

  Future<RestaurantResult> get(String restaurantId) async {
    final response = await client.get(
      Uri.parse("$_baseUrl/detail/$restaurantId"),
    );
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get restaurant with id: $response.statusCode');
    }
  }

  Future<RestaurantResult> postReview(
    CustomerReview review,
    String restaurantId,
  ) async {
    final response = await client.post(
      Uri.parse("$_baseUrl/review"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "id": restaurantId,
        "name": review.name,
        "review": review.review,
      }),
    );
    if (response.statusCode == 201) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      return throw Exception(
          'Failed to post review at restaurant id: $restaurantId');
    }
  }
}
