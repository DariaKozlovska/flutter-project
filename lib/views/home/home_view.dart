import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/login/login_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context){
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 56,
              ),
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      Text('Home Screen',
                        style: TextStyle(
                          color: MyColors.darkPurpleColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
                          child: Text('Login'),
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