import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notes_screen.dart';
import 'providers/notes_provider.dart';

class NotesPage extends StatelessWidget{
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const NotesScreen(),
    );
  }

}