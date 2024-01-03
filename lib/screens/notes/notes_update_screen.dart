import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/note.dart';
import 'providers/notes_provider.dart';
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
            const SizedBox(height: 10,),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () async {
                  if (!_isUpdate) {
                    final note = Note(
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Provider.of<NotesProvider>(context, listen: false)
                        .addNote(note);
                  } else {
                    final note = Note(
                      id: widget.note!.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                    );
                    Provider.of<NotesProvider>(context, listen: false)
                        .updateNote(note);
                  }
                  Navigator.pop(context);
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
