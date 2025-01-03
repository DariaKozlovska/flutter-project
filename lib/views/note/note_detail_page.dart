import 'package:dsw_51762/db/notes_database.dart';
import 'package:dsw_51762/model/note.dart';
import 'package:dsw_51762/views/note/add_note_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../home/home_view.dart';
import '../widgets/basic_text.dart';


class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    required this.noteId, super.key,
  });

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 76,
        ),
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
                Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(MyImages.editNoteIcon),
                      onTap: () async {
                        if (isLoading) return;

                        await Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => AddNoteView(note: note),
                        ));

                        await refreshNote();
                      }
                    ),
                    const SizedBox(width: 20,),
                    GestureDetector(
                      child: Image.asset(MyImages.deleteNoteIcon),
                      onTap: () async {
                        await NotesDatabase.instance.delete(widget.noteId);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ],
            ),
            Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    :
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        children: [
                          Text(
                            DateFormat.yMMMd().format(note.createdTime),
                            style: TextStyle(color: MyColors.lightPurpleColor),
                          ),
                          const SizedBox(height: 4),
                          BasicText(text: note.title, fontSize: 30, fontWeight: FontWeight.w700,),
                          const SizedBox(height: 4),
                          BasicText(text: note.description, fontSize: 18,)
                      ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}