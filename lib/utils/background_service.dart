import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import '../data/api_service.dart';
import '../data/models/all_restaurant_result.dart';
import '../data/models/restaurant.dart';
import '../helpers/notification_helper.dart';
import '../main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper();
    Random random = Random();
    AllRestaurantResult result = await ApiService().fetchAll();
    List<Restaurant> restaurants = result.restaurants;

    Restaurant restaurant = Restaurant(id: 'asd', name: 'Test Retaurant Notification', description: 'description', pictureId: 'pictureId', city: 'city', rating: 'rating');
    if(restaurants.isNotEmpty){
      int maxIndex = restaurants.length;
      int randomIndex = random.nextInt(maxIndex);
      restaurant = restaurants[randomIndex];
    }
    await notificationHelper
        .showNotification(flutterLocalNotificationsPlugin, restaurant);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}