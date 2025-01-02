import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/register/register_view.dart';
import 'package:dsw_51762/views/widgets/basic_text.dart';
import 'package:dsw_51762/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool boolValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 56,
            ),
            child: Column(
              children: [
                Image.asset(MyImages.logo),
                const SizedBox(height: 20,),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: BasicText(text: 'Sing In', fontWeight: FontWeight.w700, fontSize: 30,),
                ),
                const SizedBox(height: 26,),
                const BasicTextFormField(
                  hintText: 'Email or user Name',
                  preIcon: MyImages.userIcon,
                ),
                const SizedBox(height: 20,),
                const BasicTextFormField(
                    hintText: 'Password',
                    preIcon: MyImages.lockIcon,
                    obscureText: true,
                ),
                const SizedBox(height: 26,),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => print('xxx'),
                    child:  const BasicText(text: 'Forget Password ?', fontWeight: FontWeight.w700,),
                  ),
                ),
                const SizedBox(height: 26,),
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
                        'Sing In',
                      style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(builder: (context) => const RegisterView()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 60,),
                const BasicText(text: 'Or sign in With'),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          print('Google');
                        },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                        child: Image.asset(MyImages.googleIcon),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('Fb');
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                        ),
                      child: Image.asset(MyImages.fbIcon)
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('x');
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                        ),
                      child: Image.asset(MyImages.xIcon)
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('In');
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                        ),
                      child: Image.asset(MyImages.inIcon),
                    ),
                  ],
                  ),
                ),
                const SizedBox(height: 70,),
                Container(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      const BasicText(text: "Don't have account ?"),
                      const SizedBox(width: 6,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(builder: (context) => const RegisterView(),),
                          );
                        },
                        child: const BasicText(text: 'Sing Up', fontWeight: FontWeight.w700,),
                    ),
                  ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}