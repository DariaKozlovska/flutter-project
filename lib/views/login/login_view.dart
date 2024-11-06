import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/register/register_view.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(MyImages.logo),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  'Sing In',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: MyColors.darkPurpleColor,
                  ),
                ),
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
                    child:  Text(
                        'Forget Password ?',
                        style: TextStyle(
                          color: MyColors.darkPurpleColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                    ),
                  ),
                ),
                const SizedBox(height: 26,),
                SizedBox(
                  width: double.infinity,
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
                        MaterialPageRoute(builder: (context) => const RegisterView()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 60,),
                Text(
                  'Or sign in With',
                  style: TextStyle(
                    color: MyColors.darkPurpleColor,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          print("Google");
                        },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                        child: Image.asset(MyImages.googleIcon),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Fb");
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        ),
                      child: Image.asset(MyImages.fbIcon)
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("x");
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        ),
                      child: Image.asset(MyImages.xIcon)
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("In");
                      },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
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
                  children: [
                    Text(
                      "Don't have account ?",
                      style: TextStyle(
                        color: MyColors.darkPurpleColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 6,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterView()),
                        );
                      },
                      child: _singInText('Sing Up')
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

Widget _singInText(String text){
  return Text(
    text,
    style: TextStyle(
      color: MyColors.darkPurpleColor,
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  );
}