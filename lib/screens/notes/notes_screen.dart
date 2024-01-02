import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/notes_provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, provider, child) {
          final notes = provider.notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Dismissible(
                key: Key(
                  note.id.toString(),
                ),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  // TODO : Kode untuk menghapus note
                },
                child: Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    onTap: () async {
                      // TODO : Kode untuk mendapatkan note yang dipilih dan dikirimkan ke NoteAddUpdatePage
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/notes.update_or_create');
        },
      ),
    );
  }
}
