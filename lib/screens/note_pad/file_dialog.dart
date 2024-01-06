import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FileDialog extends StatelessWidget{

  final List<FileSystemEntity> files;

  const FileDialog({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your file'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final file = files[index];
          return Material(
            child: ListTile(
              title: Text(split(file.path).last),
              onTap: () {
                Navigator.pop(context, file);
              },
            ),
          );
        },
        itemCount: files.length,
      ),
    );
  }
  
}