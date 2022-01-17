import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sticky_session_app/components/background.dart';
import 'package:sticky_session_app/components/custom_button.dart';
import 'package:sticky_session_app/components/custom_input_field.dart';
import 'package:sticky_session_app/components/release_version.dart';
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: size.width * 0.95,
              child: const Text(
                "If you do not have a token, ask for meeting admin",
                style: TextStyle(fontSize: 19),
              ),
            ),
            CustomInputField(
                textLabel: "Token", color: Colors.black, onChanged: (value) {}),
            CustomInputField(
                textLabel: "Username",
                color: Colors.black,
                onChanged: (value) {}),
            CustomButton(
              text: "Log In",
              color: kButtonColor,
              textColor: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              press: () => {log("Button pressed on Login token screen")},
            ),
          ],
        ),
      ),
      releaseVersion: const ReleaseVersion(
          fontSize: 13, fontWeight: FontWeight.bold, textColor: kGrayColor),
    );
  }
}
