import 'package:flutter/material.dart';

import '../data/enums/restaurant_review_state.dart';
import '../data/models/customer_review.dart';

class RestaurantReviewProvider extends ChangeNotifier {
  late List<CustomerReview> _customerReviews;

  RestaurantReviewProvider({required List<CustomerReview> reviews}) {
    _customerReviews = reviews;
    _firstLoad();
  }
  RestaurantReviewState _state = RestaurantReviewState.idle;
  String _message = '';

  String get message => _message;
  List<CustomerReview> get reviews => _customerReviews;
  RestaurantReviewState get state => _state;

  void listenTextReview(String textReview) {
    print(textReview);
  }

  Future<bool> writeReview() async {
    return false;
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
}
