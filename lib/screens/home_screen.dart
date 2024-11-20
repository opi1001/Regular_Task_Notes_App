import 'package:flutter/material.dart';
import 'package:simple_notes_app/models/note_model.dart';
import 'package:simple_notes_app/screens/create_note.dart';
import 'package:simple_notes_app/screens/widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Note> notes = List.empty(growable: true);
  List<Note> notes = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.withOpacity(0.2),
          title: const Center(child: Text("  Regular Task Notes ")),
        ),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateNotes(
                      onNoteCreated: onNoteCreated,
                    )));
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteCard(
                  note: notes[index],
                  index: index,
                  onNoteDeleted: onNoteDeleted);
            }));
  }

  void onNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
