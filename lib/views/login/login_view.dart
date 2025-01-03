import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:dsw_51762/views/home/home_view.dart';
import 'package:dsw_51762/views/register/register_view.dart';
import 'package:dsw_51762/views/widgets/basic_text.dart';
import 'package:dsw_51762/views/widgets/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  Future<void> _validateAndSubmit() async{
    setState(() {
      _emailError = null;
      _passwordError = null;

      if (_emailController.text != 'admin@gmail.com') {
        _emailError = 'Incorrect email. Default email admin@gmail.com';
      }
      if (_passwordController.text != 'Admin1') {
        _passwordError = 'Incorrect password. Default password Admin1';
      }
    });

    if (_emailError == null && _passwordError == null ) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => const HomeView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(MyImages.logo),
                    const SizedBox(height: 20,),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: BasicText(text: 'Sing In', fontWeight: FontWeight.w700, fontSize: 30,),
                    ),
                    const SizedBox(height: 26,),
                    BasicTextFormField(
                      hintText: 'Email or user Name',
                      preIcon: MyImages.userIcon,
                      controller: _emailController,
                    ),
                    if (_emailError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _emailError!,
                          style: TextStyle(
                            color: MyColors.redColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    const SizedBox(height: 20,),
                    BasicTextFormField(
                        hintText: 'Password',
                        preIcon: MyImages.lockIcon,
                        obscureText: true,
                        controller: _passwordController,
                    ),
                    if (_passwordError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _passwordError!,
                          style: TextStyle(
                            color: MyColors.redColor,
                            fontSize: 15,
                          ),
                        ),
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
                        onPressed: _validateAndSubmit,
                        child:  Text(
                            'Sing In',
                          style: TextStyle(
                            color: MyColors.whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
                                MaterialPageRoute<void>(builder: (context) => RegisterView(),),
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
        ),
      ),
    );
  }
}