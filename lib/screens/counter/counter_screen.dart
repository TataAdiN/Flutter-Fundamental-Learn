import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;
  static const String counterNumberPrefs = 'counterNumber';
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initSharedPref();
  }

  Future<void> _initSharedPref() async {
    _prefs = await SharedPreferences.getInstance();
    _loadNumber();
  }

  void _saveNumber() {
    _prefs.setInt(counterNumberPrefs, _count);
  }

  void _incrementCounter() {
    setState(() {
      _count++;
      _saveNumber();
    });
  }

  void _loadNumber() async {
    setState(() {
      _count = _prefs.getInt(counterNumberPrefs) ?? 0;
    });
  }

  void _resetNumber() {
    _prefs.remove(counterNumberPrefs);
    _loadNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Counter'),
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
              const Text('Counter :'),
              Text(
                '$_count',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text(
                  'Reset',
                ),
                onPressed: () => _resetNumber(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _incrementCounter(),
      ),
    );
  }
}
