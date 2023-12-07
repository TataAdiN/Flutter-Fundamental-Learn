import 'package:flutter/material.dart';

class SecondScreenWithData extends StatelessWidget {
  final String arguments;
  const SecondScreenWithData(this.arguments, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen With Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(arguments),
            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
