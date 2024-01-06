import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../notes/widgets/custom_button.dart';
import 'file_dialog.dart';
import 'helpers/file_helper.dart';

class NotePadPage extends StatefulWidget {
  const NotePadPage({super.key});

  @override
  State<NotePadPage> createState() => _NotePadPageState();
}

class _NotePadPageState extends State<NotePadPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  bool get _isValid => _titleController.text.isNotEmpty;

  void _createNewFile() {
    _titleController.clear();
    _contentController.clear();
  }

  void _saveFile(BuildContext context) async {
    if (_isValid) {
      final filePath = await FileHelper.getFilePath(_titleController.text);
      FileHelper.writeFile(filePath, _contentController.text);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('File Saved'),
            actions: [
              CustomButton(
                text: 'OK',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'File Not Created',
              style: TextStyle(color: Colors.redAccent),
            ),
            content: const Text('File name must not be empty!'),
            actions: [
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'OK',
              )
            ],
          );
        },
      );
    }
  }

  void _openFile(String filePath) async {
    final content = await FileHelper.readFile(filePath);
    _contentController.text = content;
    _titleController.text = split(filePath).last.split('.').first;
  }

  void _getFilesInDirectory(BuildContext context) async {
    final navigator = Navigator.of(context);
    final directory = await getApplicationDocumentsDirectory();

    final dir = Directory(directory.path);
    final files =
        dir.listSync().toList().where((file) => file.path.contains('txt'));

    final FileSystemEntity? selectedFile = await navigator.push(
      MaterialPageRoute(
        builder: (context) => FileDialog(
          files: files.toList(),
        ),
        fullscreenDialog: true,
      ),
    );

    if (selectedFile != null) {
      _openFile(selectedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'New File',
                    onPressed: () => _createNewFile(),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Open File',
                    onPressed: () => _getFilesInDirectory(context),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: 'Save File',
                    onPressed: () => _saveFile(context),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'File Name',
                      ),
                      controller: _titleController,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Write your notes here...',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _contentController,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
}
