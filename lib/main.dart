import 'package:flutter/material.dart';

import 'screens/main_screen.dart';
import 'screens/providers/done_module_list.dart';
import 'screens/providers/provider_screen.dart';
import 'screens/set_state/done_module_list.dart';
import 'screens/set_state/set_state_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: Colors.orange,
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/set_state': (context) => const SetStateScreen(),
        '/set_state.done': (context) => DoneModuleList(
              doneModuleList:
                  ModalRoute.of(context)?.settings.arguments as List<String>,
            ),
        '/provider': (context) => const ProviderScreen(),
        '/provider.done': (context) => DoneModuleListProvider(
          doneModuleList:
          ModalRoute.of(context)?.settings.arguments as List<String>,
        ),
      },
    );
  }
}
