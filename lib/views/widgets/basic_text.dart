import 'package:flutter/material.dart';
import 'package:dsw_51762/utils/my_colors.dart';

class BasicText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  const BasicText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 15,
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: MyColors.darkPurpleColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}