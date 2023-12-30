import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../data/api_service.dart';
import '../data/enums/restaurant_review_state.dart';
import '../data/models/customer_review.dart';
import '../screens/restaurant_page/restaurant_review/widgets/validation_failed_alert.dart';

class RestaurantReviewProvider extends ChangeNotifier {
  late List<CustomerReview> _customerReviews;
  final ApiService apiService;
  String restaurantId;

  RestaurantReviewProvider({
    required this.apiService,
    required List<CustomerReview> reviews,
    required this.restaurantId,
  }) {
    _customerReviews = reviews;
    _firstLoad();
  }
  RestaurantReviewState _state = RestaurantReviewState.idle;
  String _message = '';

  String _name = '';
  String _review = '';

  String get message => _message;
  List<CustomerReview> get reviews => _customerReviews;
  RestaurantReviewState get state => _state;

  void reload() => _firstLoad();

  void listenTextName(String textName) {
    _name = textName;
  }

  void listenTextReview(String textReview) {
    _review = textReview;
  }

  Future<void> writeReview(
    BuildContext context,
    TextEditingController fieldName,
    TextEditingController fieldReview,
  ) async {
    if (_name.isEmpty || _review.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ValidationFailedAlert();
        },
      );
    } else {
      CustomerReview review = CustomerReview(
        name: _name,
        review: _review,
        date: _getCurrentDay(),
      );
      _customerReviews.add(review);
      fieldName.text = '';
      fieldReview.text = '';
      _name = '';
      _review = '';
      try {
        await apiService.postReview(review, restaurantId);
      } on SocketException catch (_) {
        _state = RestaurantReviewState.noInternet;
        notifyListeners();
      } catch (e) {
        _state = RestaurantReviewState.noInternet;
        notifyListeners();
      }
    }
    notifyListeners();
  }

  Future<dynamic> _firstLoad() async {
    if (reviews.isEmpty) {
      _state = RestaurantReviewState.noData;
      notifyListeners();
      return _message = 'Empty Data';
    } else {
      _state = RestaurantReviewState.hasData;
      notifyListeners();
      return _customerReviews;
    }
  }

  String _getCurrentDay() {
    Intl.defaultLocale = "id";
    initializeDateFormatting();
    DateTime time = DateTime.now();
    var formatter = DateFormat('d MMMM y', 'id');
    return formatter.format(time);
  }
}
