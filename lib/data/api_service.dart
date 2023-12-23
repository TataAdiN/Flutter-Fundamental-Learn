import 'dart:convert';
import 'package:flutter_fundamental/data/models/all_restaurant_result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  static String imageUrl(String imageId){
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
}