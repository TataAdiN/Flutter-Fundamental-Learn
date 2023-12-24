import 'dart:io';

import 'package:flutter/material.dart';

import '../data/api_service.dart';
import '../data/enums/result_state.dart';
import '../data/models/search_result.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService});

  late SearchResult _searchResult;
  late ResultState _state;
  String _message = '';

  SearchResult get result => _searchResult;
  String get message => _message;
  ResultState get state => _state;

  void searchRestaurant(String searchQuery) => _search(searchQuery);

  Future<dynamic> _search(String searchQuery) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final result = await apiService.findByName(searchQuery);
      if (result.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searchResult = result;
      }
    } on SocketException catch (_) {
      _state = ResultState.noInternet;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
