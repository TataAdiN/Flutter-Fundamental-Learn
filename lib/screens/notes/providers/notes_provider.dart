import 'package:flutter/material.dart';

import '../helpers/database_helper.dart';
import '../models/note.dart';

class NotesProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;
  List<Note> _notes = [];

  NotesProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  List<Note> get notes => _notes;

  void _getAllNotes() async {
    _notes = await _dbHelper.getNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await _dbHelper.insertNote(note);
    _getAllNotes();
  }

  Future<Note> getNoteById(int id) async {
    return await _dbHelper.getNoteById(id);
  }

  void updateNote(Note note) async {
    await _dbHelper.updateNote(note);
    _getAllNotes();
  }

  void deleteNote(int id) async {
    await _dbHelper.deleteNote(id);
    _getAllNotes();
  }
}
