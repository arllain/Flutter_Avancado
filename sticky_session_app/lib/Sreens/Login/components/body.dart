import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sticky_session_app/Sreens/Login/components/background.dart';
import 'package:sticky_session_app/components/custom_button.dart';
import 'package:sticky_session_app/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This size provides us total height and width of our screen
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.10),
          Image.asset("assets/icons/logo_symbol.png"),
          SizedBox(height: size.height * 0.02),
          const Text(
            "Sticky Sessions",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          SizedBox(height: size.height * 0.25),
          CustomButton(
            text: "Log In with Gmail",
            color: kButtonColor,
            textColor: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            press: () => {log("Log In with Gmail")},
          ),
          CustomButton(
            text: "Log In with the token",
            color: kPurpleColor,
            textColor: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            press: () {
              log("Log In with the token");
            },
          ),
        ],
      ),
    ));
  }
}
