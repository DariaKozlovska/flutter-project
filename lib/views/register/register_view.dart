import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/login/login_view.dart';
import 'package:dsw_51762/views/widgets/basic_text.dart';
import 'package:dsw_51762/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
                child: Image.asset(
                  MyImages.cornerImage,
                  width: 116,
                  height: 92,
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 56,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (context) => const LoginView(),
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
                            const SizedBox(height: 100,),
                            const BasicText(text: 'Sing Up', fontSize: 30, fontWeight: FontWeight.w700,),
                          ],
                        )
                      ),
                      const SizedBox(height: 46,),
                      BasicTextFormField(
                        hintText: 'Full Name',
                        preIcon: MyImages.userIcon,
                        controller: fullNameController,
                      ),
                      const SizedBox(height: 20,),
                      BasicTextFormField(
                        hintText: 'Email',
                        preIcon: MyImages.emailIcon,
                        controller: emailController,
                      ),
                      const SizedBox(height: 20,),
                      BasicTextFormField(
                        hintText: 'Password',
                        preIcon: MyImages.lockIcon,
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20,),
                      BasicTextFormField(
                        hintText: 'Confirm Password',
                        preIcon: MyImages.lockIcon,
                        obscureText: true,
                        controller: confirmPasswordController,
                      ),
                      const SizedBox(height: 80,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: MyColors.lightPurpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child:  Text(
                            'Sing Up',
                            style: TextStyle(
                              color: MyColors.whiteColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (context) => const LoginView(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 72,),
                      Container(
                        alignment: FractionalOffset.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const BasicText(text: 'Already have an account ?'),
                            const SizedBox(width: 6,),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (context) => const LoginView(),
                                    ),
                                  );
                                },
                                child: const BasicText(text: 'Sing In', fontWeight: FontWeight.w700,)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}