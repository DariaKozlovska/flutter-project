import 'package:dsw_51762/utils/my_colors.dart';
import 'package:flutter/material.dart';

class BasicTextFormField extends StatefulWidget {
  final String hintText;
  final String preIcon;
  final bool obscureText;
  final TextEditingController controller;

  const BasicTextFormField(
      {super.key, required this.hintText, required this.preIcon, this.obscureText = false, required this.controller,});

  @override
  _BasicTextFormFieldState createState() => _BasicTextFormFieldState();
}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _toggleVisibility() {
  setState(() {
  _isObscured = !_isObscured;
  });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        obscureText: _isObscured,
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
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 16,),
            child: Image.asset(widget.preIcon,),
          ),
          suffixIcon: widget.obscureText
              ? GestureDetector(
                onTap: _toggleVisibility,
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: MyColors.lightPurpleColor,
                ),
              ) : null,
        ),
    );
  }
}
