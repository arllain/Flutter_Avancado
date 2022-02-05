import 'package:flutter/material.dart';
import 'package:sticky_session_app/Sreens/Sessions/widget/body.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/widgets/app_drawer.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        drawer: const AppDrawer(),
        body: const Body(),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 1,
    backgroundColor: Colors.white,
    foregroundColor: kRedColor,
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
        onPressed: () {
          Navigator.pushNamed(context, notificationRouter);
        },
      )
    ],
  );
}
