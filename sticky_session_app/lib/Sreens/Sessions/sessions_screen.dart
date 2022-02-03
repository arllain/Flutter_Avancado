import 'package:flutter/material.dart';
import 'package:sticky_session_app/constants.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.red,
          ),
          centerTitle: true,
          title: const Text(
            "Mettings",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: kDarkGrayColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
