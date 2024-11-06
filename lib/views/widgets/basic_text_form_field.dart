import 'package:dsw_51762/utils/my_colors.dart';
import 'package:dsw_51762/utils/my_images.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  final String hintText;
  final String preIcon;
  final bool obscureText;
  const BasicTextFormField({super.key, required this.hintText, required this.preIcon, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: MyColors.lightPurpleColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: MyColors.lightPurpleColor,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: MyColors.lightPurpleColor,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(preIcon,),
          ),
        ),
    );
  }
}
