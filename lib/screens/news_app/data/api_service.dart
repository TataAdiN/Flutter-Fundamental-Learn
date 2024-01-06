import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/article_result.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = '7c3edeb744df499caed756e014b90336';
  static const String _category = 'business';
  static const String _country = 'us';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(
      Uri.parse(
        "${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey",
      ),
    );
    if (response.statusCode == 200) {
      return ArticleResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
