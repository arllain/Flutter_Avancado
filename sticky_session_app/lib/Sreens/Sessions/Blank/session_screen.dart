import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticky_session_app/Sreens/Sessions/Create/session_create_screen.dart';
import 'package:sticky_session_app/constants.dart';

class SessionScreen extends StatelessWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            // Icon(Icons.),
            Text(
              'There is no sessions.',
              style: TextStyle(color: kDarkGrayColor, fontSize: 17),
            ),
            Text(
              "Create one by clicking in + button",
              style: TextStyle(color: kLightGrayColor, fontSize: 13),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SessionCreateScreen();
              },
            ),
          )
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Retrospective",
        style: TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context, true);
          }),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
