import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/data/models/restaurant.dart';

import '../helpers/notification_helper.dart';
import '../helpers/preferences_helper.dart';
import '../main.dart';
import '../themes/styles.dart';

class PreferencesProvider extends ChangeNotifier {

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyNotificationActive = false;
  bool get isDailyNotificationActive => _isDailyNotificationActive;

  PreferencesHelper preferencesHelper;
  BuildContext context;

  PreferencesProvider({required this.preferencesHelper, required this.context}) {
    _getTheme();
    _getDailyNotificationPreferences();
  }

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyNotificationPreferences() async {
    _isDailyNotificationActive = await preferencesHelper.isDailyNotificationActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyNotification(bool value, BuildContext context) {
    preferencesHelper.setDailyNotification(value);
    Random random = Random();
    int randomNumber = random.nextInt(2);
    print(randomNumber);
    notification();
    _getDailyNotificationPreferences();
  }

  Future<void> notification() async {
    final NotificationHelper notificationHelper = NotificationHelper();
    notificationHelper.configureSelectNotificationSubject(
        context);
    await notificationHelper
        .showNotification(flutterLocalNotificationsPlugin, Restaurant(id: 'asd', name: 'Melting Pot', description: 'description', pictureId: 'pictureId', city: 'city', rating: 'rating'));
  }
}