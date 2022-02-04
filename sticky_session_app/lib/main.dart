import 'package:flutter/material.dart';
import 'package:sticky_session_app/Sreens/Login/login_screen.dart';
import 'package:sticky_session_app/Sreens/Notes/Create/note_create_screen.dart';
import 'package:sticky_session_app/Sreens/Sessions/sessions_screen.dart';

import 'Sreens/LoginToken/login_token_screen.dart';
import 'Sreens/Notes/notes_screen.dart';
import 'Sreens/Retrospective/retrospective_screen.dart';
import 'Sreens/Sessions/Create/session_create_screen.dart';
import 'Sreens/notification/notification_screen.dart';

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
      theme: ThemeData(primarySwatch: Colors.red),
      // home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/login/token': (context) => const LoginTokenScreen(),
        '/sessions': (context) => const SessionsScreen(),
        '/sessions/create': (context) => const SessionCreateScreen(),
        '/retrospective': (context) => const RetrospectiveScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/notes': (context) => const NotesScreen(),
        '/notes/create': (context) => const NoteCreateScreen(),
      },
      initialRoute: "/login",
    );
  }
}
