import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter Fundamental Learn'),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/fundamental_app'),
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Flutter Navigation'),
                subtitle: Text('Flutter Navigation Fundamental Learning'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/news_app'),
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('News App'),
                subtitle:
                    Text('Flutter News App Example, Fundamental Learning'),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/flutter_ui'),
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListTile(
                tileColor: Colors.white,
                title: Text('Flutter UI'),
                subtitle: Text('Flutter UI Design Fundamental Learning'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
