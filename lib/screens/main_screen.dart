import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Local Storage'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: ListView(
          children: [
            const Divider(
              thickness: 0,
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/notes'),
              tileColor: Colors.white,
              title: const Text('Notes'),
            ),
            const Divider(
              thickness: 0,
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/counter'),
              tileColor: Colors.white,
              title: const Text('Counter'),
            ),
            const Divider(
              thickness: 0,
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/note_pad'),
              tileColor: Colors.white,
              title: const Text('Note Pad'),
            ),
            const Divider(
              thickness: 0,
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/news_app'),
              tileColor: Colors.white,
              title: const Text('News App'),
            ),
          ],
        ),
      ),
    );
  }
}
