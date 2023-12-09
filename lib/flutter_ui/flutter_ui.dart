import 'package:flutter/material.dart';

class FlutterUI extends StatelessWidget {
  const FlutterUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter UI Fundamental'),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Layouts and Typography'),
                subtitle: Text('Flutter Layouts and Typography Fundamental'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Gesture'),
                subtitle: Text('Flutter Gestures Fundamental'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Slivers'),
                subtitle: Text('Flutter Slivers Fundamental'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
