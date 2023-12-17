import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('State Management'),
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
              onTap: ()=> Navigator.pushNamed(context, '/set_state'),
              tileColor: Colors.white,
              title: const Text('setState'),
            ),
            const Divider(
              thickness: 0,
            ),
            const ListTile(
              tileColor: Colors.white,
              title: Text('Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
