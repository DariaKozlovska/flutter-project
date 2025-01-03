import 'package:dsw_51762/views/home/home_view.dart';
import 'package:flutter/material.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 76,
            ),
            child: SingleChildScrollView(
              child: Column (
                children: [
                  const Text('Add note'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(builder: (context) => HomeView(),),
                      );
                    },
                    child: Text('back to home'),
                  ),
                ],
              )
            ),
          )
        )
      )
    );
  }
}