import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sticky_session_app/Sreens/Login/login_screen.dart';
import 'package:sticky_session_app/Sreens/Notes/Create/note_create_screen.dart';
import 'package:sticky_session_app/Sreens/Sessions/sessions_screen.dart';
import 'Sreens/LoginToken/login_token_screen.dart';
import 'Sreens/Notes/notes_screen.dart';
import 'Sreens/Retrospective/retrospective_screen.dart';
import 'Sreens/Sessions/Create/session_create_screen.dart';
import 'Sreens/notification/notification_screen.dart';
import 'database/database_service.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'sticky_database.db'),
    onCreate: (db, version) {
      db.execute(
        'CREATE TABLE meetings(id TEXT PRIMARY KEY, description TEXT, endDate TEXT, local TEXT, people INTEGER, sessions INTEGER, startDate TEXT, title TEXT)'
      );
      db.execute(
        'CREATE TABLE sessions(id TEXT PRIMARY KEY, meetingId TEXT, name TEXT, description TEXT, columns TEXT, highlight TEXT, answer INTEGER)'
      );
      db.execute(
        'CREATE TABLE stickies(id TEXT PRIMARY KEY, content TEXT, columnName TEXT, userName TEXT, sessionId TEXT)'
      );
    },
    version: 3,
  );

  DatabaseService().setDatabase(database);

  runApp( const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: AppLocalizations.of(context)!.title,
      theme: ThemeData(primarySwatch: Colors.red),
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
