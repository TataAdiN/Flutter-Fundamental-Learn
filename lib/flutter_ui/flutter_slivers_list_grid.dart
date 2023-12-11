import 'package:flutter/material.dart';

import 'learning_path_list.dart';

class FlutterSliversListGrid extends StatelessWidget {
  const FlutterSliversListGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Learning Paths'),
      ),
      body: const LearningPathList(),
    );
  }
}
