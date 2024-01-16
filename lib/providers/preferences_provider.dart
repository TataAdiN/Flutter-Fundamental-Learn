import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

import '../helpers/preferences_helper.dart';
import '../helpers/timezone_helper.dart';
import '../themes/styles.dart';
import '../utils/background_service.dart';

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
    _getDailyNotificationPreferences();
    setSchedule(value);
  }

  Future<bool> setSchedule(bool value) async {
    if (value) {
      notifyListeners();
      bool value = await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
      return value;
    } else {
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}