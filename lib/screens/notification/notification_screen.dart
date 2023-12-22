import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fundamental/main.dart';

import 'helpers/notification_helper.dart';
import 'widgets/custom_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(
        context, '/notification.detail');
    _notificationHelper.configureDidReceiveLocalNotificationSubject(
        context, '/notification.detail');
  }

  Future<void> initNotification() async{

  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Set State'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                CustomButton(
                  text: 'Show plain notification with payload',
                  onPressed: () async {
                    await _notificationHelper
                        .showNotification(flutterLocalNotificationsPlugin);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show plain notification that has no body with payload',
                  onPressed: () async {
                    await _notificationHelper.showNotificationWithNoBody(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show grouped notifications [Android]',
                  onPressed: () async {
                    await _notificationHelper.showGroupedNotifications(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text:
                  'Show progress notification - updates every second [Android]',
                  onPressed: () async {
                    await _notificationHelper.showProgressNotification(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show big picture notification [Android]',
                  onPressed: () async {
                    await _notificationHelper.showBigPictureNotification(
                        flutterLocalNotificationsPlugin);
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Show notification with attachment [iOS]',
                  onPressed: () async {
                    await _notificationHelper.showNotificationWithAttachment(
                        flutterLocalNotificationsPlugin);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
