import 'package:flutter/material.dart';

import 'screens/counter/counter_screen.dart';
import 'screens/main_screen.dart';
import 'screens/note_pad/note_pad_page.dart';
import 'screens/notes/notes_page.dart';
import 'screens/notes/notes_update_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Storage',
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
        '/notes': (context) => const NotesPage(),
        '/notes.update_or_create': (context) => const NotesUpdateScreen(),
        '/counter': (context) => const CounterScreen(),
        '/note_pad': (context) => const NotePadPage(),
      },
    );
  }
}
