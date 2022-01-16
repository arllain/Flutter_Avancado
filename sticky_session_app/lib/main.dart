import 'package:flutter/material.dart';
import 'package:sticky_session_app/Sreens/Login/login_screen.dart';
import 'package:sticky_session_app/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky Session',
      theme: ThemeData(
          primaryColor: Colors.white, scaffoldBackgroundColor: kPurpleColor),
      home: const LoginScreen(),
    );
  }
}
