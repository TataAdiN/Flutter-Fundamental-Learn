import 'dart:io';

import 'package:flutter/material.dart';

import '../data/api_service.dart';
import '../data/enums/restaurant_result_state.dart';
import '../data/enums/result_state.dart';
import '../data/models/restaurant_result.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService, required String restaurantId}) {
    _get(restaurantId);
  }

  late RestaurantResult _restaurantResult;
  late RestaurantResultState _state;
  String _message = '';

  String get message => _message;
  RestaurantResult get result => _restaurantResult;
  RestaurantResultState get state => _state;

  Future<dynamic> _get(String restaurantId) async {

    try {
      _state = RestaurantResultState.loading;
      notifyListeners();
      final result = await apiService.get(restaurantId);
      if (result.restaurant == null) {
        _state = RestaurantResultState.notExist;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = RestaurantResultState.exist;
        notifyListeners();
        return _restaurantResult = result;
      }
    } on SocketException catch (_) {
      _state = RestaurantResultState.noInternet;
    } catch (e) {
      _state = RestaurantResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
