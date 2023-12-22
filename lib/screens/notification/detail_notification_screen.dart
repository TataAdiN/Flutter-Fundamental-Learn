import 'package:flutter/material.dart';

import 'models/received_notification.dart';

class DetailNotificationScreen extends StatelessWidget {
  static const routeName = '/detail_page';

  const DetailNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReceivedNotification arg =
    ModalRoute.of(context)?.settings.arguments as ReceivedNotification;
    return Scaffold(
      appBar: AppBar(
        title: Text('Title: ${arg.payload}'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}