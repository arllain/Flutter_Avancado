// ignore_for_file: unnecessary_const

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticky_session_app/constants.dart';

class NoteCreateScreen extends StatefulWidget {
  const NoteCreateScreen({Key? key}) : super(key: key);

  @override
  State<NoteCreateScreen> createState() => _NoteCreateScreenState();
}

class _NoteCreateScreenState extends State<NoteCreateScreen> {
  var textControllerNote = TextEditingController();
  var isButtonEnabled = false;

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = textControllerNote.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    textControllerNote.addListener(() => updateButtonStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrayBackGroundColor,
      appBar: buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        child: TextField(
          maxLines: 10,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Write a note...',
            contentPadding: EdgeInsets.all(10.0),
          ),
          controller: textControllerNote,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: kRedColor,
      elevation: 1,
      centerTitle: true,
      title: const Text(
        "Create Note",
        style: TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.check,
            color: isButtonEnabled ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            log("save note");
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
