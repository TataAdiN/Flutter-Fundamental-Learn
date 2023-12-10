import 'package:flutter/material.dart';

class FlutterLayouts extends StatelessWidget {
  const FlutterLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter UI Fundamental'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    child: const Text('Hello!'),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Text('Goodbye!'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: const Text('Hello! This is a very long Text!'),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: const Text('Goodbye!'),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: const Text('Hello! This is a very long Text!'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: const Text('Goodbye!'),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      color: Colors.red,
                      child: const Text('Hello! This is a very long Text!'),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: Colors.green,
                      child: const Text('Goodbye!'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(10.0),
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
