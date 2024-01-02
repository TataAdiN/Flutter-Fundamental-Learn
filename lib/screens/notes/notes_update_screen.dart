import 'package:flutter/material.dart';

import 'models/note.dart';
import 'widgets/custom_button.dart';

class NotesUpdateScreen extends StatefulWidget {
  const NotesUpdateScreen({super.key, this.note});
  final Note? note;

  @override
  State<NotesUpdateScreen> createState() => _NotesUpdateScreenState();
}

class _NotesUpdateScreenState extends State<NotesUpdateScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      _isUpdate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update or Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Judul',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () async {
                  // TODO : Tambahkan kode untuk menyimpan atau mengedit note
                },
                text: 'Simpan',
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
