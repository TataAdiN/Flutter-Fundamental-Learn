import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/preferences_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (Theme.of(context).brightness == Brightness.light)
          ? Colors.grey[200]
          : Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Dark Theme'),
            trailing: Consumer<PreferencesProvider>(
              builder: (context, provider, _) {
                return Switch.adaptive(
                  activeColor: Colors.orange,
                  value: provider.isDarkTheme,
                  onChanged: (value) =>
                      Provider.of<PreferencesProvider>(context, listen: false)
                          .enableDarkTheme(!provider.isDarkTheme),
                );
              },
            ),
          ),
          ListTile(
            title: const Text('Scheduling Notifications'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
