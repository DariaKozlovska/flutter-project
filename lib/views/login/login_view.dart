import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:flutter/material.dart';

import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 56.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(MyImages.logo),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  'Sing In',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: MyColors.darkPurpleColor,
                  )
                ),
                ),
                SizedBox(height: 26,),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: MyColors.lightPurpleColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: MyColors.lightPurpleColor,
                          width: 2.0,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: MyColors.lightPurpleColor,
                        width: 2.0,
                      )
                    ),
                    hintText: 'Email or User Name',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Image.asset(MyImages.userIcon,),)
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color: MyColors.lightPurpleColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: MyColors.lightPurpleColor,
                          width: 2.0,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: MyColors.lightPurpleColor,
                          width: 2.0,
                        )
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.3),
                    ),
                    prefixIcon: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset(MyImages.lockIcon,)
                    )
                  ),
                ),
                SizedBox(height: 26,),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => print('xxx'),
                    child:  Text(
                        'Forget Password ?',
                        style: TextStyle(
                          color: MyColors.darkPurpleColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 26,),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: MyColors.lightPurpleColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      )
                    ),
                    child:  Text(
                        'Sing In',
                      style: TextStyle(
                        color: MyColors.whiteColor,
                        fontSize: 15.0,
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
                SizedBox(height: 60,),
                Text(
                  'Or sign in With',
                  style: TextStyle(
                    color: MyColors.darkPurpleColor,
                    fontSize: 15.0,
                  )
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          print("Google");
                        },
                        child: Image.asset(MyImages.googleIcon),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        )
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("Fb");
                      },
                      child: Image.asset(MyImages.fbIcon),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("x");
                      },
                      child: Image.asset(MyImages.xIcon),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("In");
                      },
                      child: Image.asset(MyImages.inIcon),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 50),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )
                        )
                    ),
                  ],
                  ),
                ),
                SizedBox(height: 70.0,),
                Container(
                  alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account ?",
                      style: TextStyle(
                        color: MyColors.darkPurpleColor,
                        fontSize: 15.0,
                      )
                    ),
                    SizedBox(width: 6.0,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterView()),
                        );
                      },
                      child: Text(
                        'Sing Up',
                        style: TextStyle(
                          color: MyColors.darkPurpleColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )
                      )
                    )
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