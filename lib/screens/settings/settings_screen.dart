import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Material(
            child: ListTile(
              title: const Text('Dark Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.orange,
                value: false,
                onChanged: (value) {},
              ),
            ),
          ),
          Material(
            child: ListTile(
              title: const Text('Scheduling Notifications'),
              trailing: Switch.adaptive(
                value: false,
                onChanged: (value) {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
