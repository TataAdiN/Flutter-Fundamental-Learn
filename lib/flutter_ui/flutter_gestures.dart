import 'package:flutter/material.dart';

class FlutterGestures extends StatefulWidget {
  const FlutterGestures({super.key});

  @override
  State<FlutterGestures> createState() => _FlutterGesturesState();
}

class _FlutterGesturesState extends State<FlutterGestures> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int numLongPress = 0;
  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Flutter Gestures Fundamental'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  numTaps++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  numDoubleTaps++;
                });
              },
              onLongPress: () {
                setState(() {
                  numLongPress++;
                });
              },
              /*
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  double delta = details.delta.dy;
                  posY += delta;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  double delta = details.delta.dx;
                  posX += delta;
                });
              },*/
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  posX += deltaX;
                  posY += deltaY;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: const BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Taps: $numTaps - Double Taps: $numDoubleTaps - Long Press: $numLongPress',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  void center(BuildContext context) {
    double currentPosX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    double currentPosY =
        (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      posX = currentPosX;
      posY = currentPosY;
    });
  }
}
