import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const darkTheme = 'DARK_THEME';
  static const dailyNotifications = 'DAILY_NOTIFICATIONS';

  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotifications) ?? false;
  }

  void setDailyNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotifications, value);
  }
}