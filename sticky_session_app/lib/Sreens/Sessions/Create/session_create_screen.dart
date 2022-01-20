// ignore_for_file: unnecessary_const

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticky_session_app/constants.dart';
import 'widgets/body.dart';

class SessionCreateScreen extends StatelessWidget {
  const SessionCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      backgroundColor: kGrayBackGroundColor,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Create Session",
        style: TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context, true);
          }),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          onPressed: () {
            log("save session");
          },
        )
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
