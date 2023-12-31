import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'services/background_service.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  final BackgroundService _service = BackgroundService();

  @override
  void initState() {
    super.initState();
    port.listen((_) async => await _service.someTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent
                ),
                child: const Text(
                  'Alarm with Delayed (Once)',
                ),
                onPressed: () async {
                  await AndroidAlarmManager.oneShot(
                    const Duration(seconds: 5),
                    1,
                    BackgroundService.callback,
                    exact: true,
                    wakeup: true,
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent
                ),
                child: const Text(
                  'Alarm with Date Time (Once)',
                ),
                onPressed: () async {
                  await AndroidAlarmManager.oneShotAt(
                    DateTime.now().add(const Duration(seconds: 5)),
                    2,
                    BackgroundService.callback,
                    exact: true,
                    wakeup: true,
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent
                ),
                child: const Text(
                  'Alarm with Periodic',
                ),
                onPressed: () async {
                  await AndroidAlarmManager.periodic(
                    const Duration(minutes: 1),
                    3,
                    BackgroundService.callback,
                    startAt: DateTime.now(),
                    exact: true,
                    wakeup: true,
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent
                ),
                child: const Text(
                  'Cancel Alarm by Id',
                ),
                onPressed: () async {
                  await AndroidAlarmManager.cancel(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
