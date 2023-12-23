import 'package:flutter/material.dart';

import '../data/api_service.dart';
import '../data/enums/result_state.dart';
import '../data/models/all_restaurant_result.dart';

class AllRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  AllRestaurantProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late AllRestaurantResult _allRestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  AllRestaurantResult get result => _allRestaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final result = await apiService.fetchAll();
      if (result.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _allRestaurantResult = result;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}