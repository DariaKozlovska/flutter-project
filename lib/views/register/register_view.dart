import 'package:dsw_51762/utils/my_images.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: RichText(
                        text: TextSpan(

                          children: [
                            WidgetSpan(
                              child: Image.asset(MyImages.backIcon,),
                            ),
                            TextSpan(text: 'Back', style: TextStyle(
                              color: MyColors.darkPurpleColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,))
                          ],
                        ),
                      )
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