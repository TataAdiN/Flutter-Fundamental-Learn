import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notes_update_screen.dart';
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
                  provider.deleteNote(note.id!);
                },
                child: Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    onTap: () async {
                      final navigator =  Navigator.of(context);
                      final selectedNote = await provider.getNoteById(note.id!);
                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NotesUpdateScreen(
                              note: selectedNote,
                            );
                          },
                        ),
                      );
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
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const NotesUpdateScreen(
                );
              },
            ),
          );
        },
      ),
    );
  }
}
