import 'package:dsw_51762/db/notes_database.dart';
import 'package:dsw_51762/model/note.dart';
import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/login/login_view.dart';
import 'package:dsw_51762/views/note/add_note_view.dart';
import 'package:dsw_51762/views/note/note_detail_page.dart';
import 'package:dsw_51762/views/widgets/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// notes_page

class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  Future<void> refreshNotes() async {
    setState(() => isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  Future<void> _logout(BuildContext context) async {
    // Clear login state from shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigate to LoginView
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const LoginView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SizedBox(
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
                  BasicText(text: 'Home', fontSize: 30, fontWeight: FontWeight.w700,),
                  Row(
                    children: [
                      GestureDetector(
                        child: Image.asset(MyImages.addNoteIcon,),
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute<void>(builder: (context) => const AddNoteView(),),
                          );
                          await refreshNotes();
                        },
                      ),
                      const SizedBox(width: 20,),
                      GestureDetector(
                        onTap: ()=> _logout(context),
                        child: Image.asset(MyImages.logoutIcon,),
                      ),
                    ],
                  ),
                  ],
                ),
              const SizedBox(height: 16),
              // Notes List
              Expanded(
                child: isLoading
                    ? const Center(
                      child: CircularProgressIndicator(),
                    )
                      : notes.isEmpty
                    ? const Center(
                        child: BasicText(text: 'No notes added'),
                    )
                    : buildNotes(),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildNotes() => ListView.builder(
    itemCount: notes.length,
    itemBuilder: (context, index) {
      final note = notes[index];
      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) => NoteDetailPage(noteId: note.id!),
            ),
          );
          refreshNotes();
        },
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: MyColors.lightPurpleColor, // Background color
            borderRadius: BorderRadius.circular(8.0), // Rounded corners with 15.0 radius
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              note.title, // Ensure the `title` field exists in your `Note` model
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    },
  );
}