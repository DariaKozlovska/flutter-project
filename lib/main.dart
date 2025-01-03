import 'package:dsw_51762/views/home/home_view.dart';
import 'package:dsw_51762/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await _checkIfLoggedIn();

  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: isLoggedIn ? const HomeView() : const LoginView(),
  ));
}

Future<bool> _checkIfLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false; // Default to false if not set
}
