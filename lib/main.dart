import 'package:flutter/material.dart';
import 'package:forcard/screens/home.dart';
import 'package:forcard/screens/login_screen.dart';
import 'package:forcard/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: LoginScreen(),
    );
  }
}
