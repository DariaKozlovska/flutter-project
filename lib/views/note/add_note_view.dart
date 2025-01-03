import 'package:dsw_51762/db/notes_database.dart';
import 'package:dsw_51762/model/note.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/home/home_view.dart';
import 'package:dsw_51762/views/widgets/basic_text.dart';
import 'package:dsw_51762/views/widgets/note_form_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class AddNoteView extends StatefulWidget {
  final Note? note;

  const AddNoteView({
    super.key,
    this.note,
  });

  @override
  State<AddNoteView> createState() => _AddNoteViewStage();
}

class _AddNoteViewStage extends State<AddNoteView> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }


  @override
  Widget build(BuildContext context){
    final isFormValid = title.isNotEmpty && description.isNotEmpty;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 76,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const HomeView(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset(MyImages.backIcon),
                              const BasicText(text: 'Back', ),
                            ],
                          )
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: MyColors.whiteColor,
                          backgroundColor: isFormValid ? MyColors.darkPurpleColor : Colors.grey.shade700,
                        ),
                        onPressed: addOrUpdateNote,
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                  NoteFormWidget(
                    title: title,
                    description: description,
                    onChangedTitle: (title) => setState(() => this.title = title),
                    onChangedDescription: (description) =>
                        setState(() => this.description = description),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      description: description,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      description: description,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}