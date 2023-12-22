
import 'dart:isolate';
import 'dart:ui';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static const String _isolateName = 'isolate';

  static BackgroundService? _instance;

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
    SendPort uiSendPort = IsolateNameServer.lookupPortByName(_isolateName)!;
    uiSendPort?.send(null);
  }

  Future<void> someTask() async {
    print('Updated data from the background isolate');
  }
}