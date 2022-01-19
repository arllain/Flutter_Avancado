import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sticky_session_app/components/selected_color.dart';
import 'package:sticky_session_app/components/background.dart';
import 'package:sticky_session_app/components/custom_input_field.dart';
import 'package:sticky_session_app/components/release_version.dart';
import 'package:sticky_session_app/components/text_field_container.dart';
import 'package:sticky_session_app/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomInputField(
                textLabel: "Title", color: Colors.black, onChanged: (value) {}),
            CustomInputField(
                textLabel: "Description",
                color: Colors.black,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                maxLength: 30,
                alignLabelWithHint: true,
                onChanged: (value) {}),
            const TextFieldContainer(
              child: Text(
                "Select a color",
                style: TextStyle(fontSize: 18, color: kGrayTextColor),
              ),
            ),
            const SelectedColor(),
          ],
        ),
      ),
      releaseVersion: const ReleaseVersion(
          fontSize: 13, fontWeight: FontWeight.bold, textColor: kGrayColor),
    );
  }
}