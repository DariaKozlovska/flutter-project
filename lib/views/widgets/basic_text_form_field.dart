import 'package:dsw_51762/utils/my_colors.dart';
import 'package:flutter/material.dart';

//Validator function for Full Name
String? fullNameValidation(String? value){
  if (value == null || value.isEmpty){
    return 'Please enter your name';
  }
  return null;
}

// Validator function for email
String? emailValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

// Validator function for password
String? passwdValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  final passRegExp = RegExp(r"[A-Z][a-z][0-9]");
  if (value.length < 8) {
    return 'Password must be at least 6 characters';
  }
  if (!passRegExp.hasMatch(value)){
    return 'Password should have big and small letters and numbers from 0 to 9';
  }
  return null;
}

//Validator function for password and confirm password
// String? passwordMatchValidation(String? password, String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please confirm your password';
//   }
//   if (value != password) {
//     return 'Passwords do not match';
//   }
//   return null;
// }

class BasicTextFormField extends StatefulWidget {
  final String hintText;
  final String preIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const BasicTextFormField(
      {super.key, required this.hintText, required this.preIcon, this.obscureText = false, this.validator});

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
        obscureText: _isObscured,
        validator: widget.validator,
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
