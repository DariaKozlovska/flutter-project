import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/login/login_view.dart';
import 'package:dsw_51762/views/note/add_note_view.dart';
import 'package:dsw_51762/views/widgets/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

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
                child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BasicText(text: 'Home', fontSize: 30, fontWeight: FontWeight.w700,),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(builder: (context) => const AddNoteView(),),
                                  );
                                },
                                child: Image.asset(MyImages.addNoteIcon,),
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
                    ]
                )
              )
            ),
          )
        )
    );
  }
}