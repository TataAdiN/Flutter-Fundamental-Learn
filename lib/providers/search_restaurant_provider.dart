import 'dart:io';

import 'package:flutter/material.dart';

import '../data/api_service.dart';
import '../data/enums/search_result_state.dart';
import '../data/models/search_result.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService});

  late SearchResult _searchResult;
  SearchResultState _state = SearchResultState.idle;
  String _message = '';
  String _searchQuery = '';

  SearchResult get result => _searchResult;
  String get message => _message;
  SearchResultState get state => _state;

  void searchRestaurant(String searchQuery) {
    if (searchQuery.isNotEmpty) {
      _search(searchQuery);
      _searchQuery = searchQuery;
    } else {
      _searchQuery = 'zzzzzzzzzzzzzzzzz';
      _search(_searchQuery);
    }
  }

  void retrySearch() => _search(_searchQuery);

  Future<dynamic> _search(String searchQuery) async {
    try {
      _state = SearchResultState.loading;
      notifyListeners();
      final result = await apiService.findByName(searchQuery);
      if (result.restaurants.isEmpty) {
        _state = SearchResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = SearchResultState.hasData;
        notifyListeners();
        return _searchResult = result;
      }
    } on SocketException catch (_) {
      _state = SearchResultState.noInternet;
      notifyListeners();
    } catch (e) {
      _state = SearchResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
