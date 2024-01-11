import 'package:flutter/material.dart';

import '../data/enums/result_state.dart';
import '../data/models/restaurant.dart';
import '../data/sqlite_service.dart';

class FavoriteProvider extends ChangeNotifier {
  final SqliteService service;

  FavoriteProvider({required this.service}) {
    _fetchFavorites();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _favorites = [];
  List<Restaurant> get favorites => _favorites;

  void _fetchFavorites() async {
    _state = ResultState.loading;
    _favorites = await service.fetchFavorites();
    if (_favorites.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await service.insertFavorite(restaurant);
      _fetchFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String restaurantId) async {
    final favoriteRestaurant = await service.findById(restaurantId);
    return favoriteRestaurant.isNotEmpty;
  }

  void removeFavorite(String restaurantId) async {
    try {
      await service.removeById(restaurantId);
      _fetchFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
