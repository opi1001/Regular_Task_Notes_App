import 'package:flutter/material.dart';
import 'package:simple_notes_app/models/note_model.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({
    super.key,
    required this.onNoteCreated,
  });

  final Function(Note) onNoteCreated;

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  final tittleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.withOpacity(0.1),
        title: const Center(child: Text("Create  Notes")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: tittleController,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: 'given tittle',
                labelText: 'tittle',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                hintText: 'your Story',
                labelText: 'descriptions',
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (tittleController.text.isEmpty) {
            return;
          }
          if (bodyController.text.isEmpty) {
            return;
          }

          final note = Note(
            tittle: tittleController.text,
            body: bodyController.text,
          );

          widget.onNoteCreated(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
