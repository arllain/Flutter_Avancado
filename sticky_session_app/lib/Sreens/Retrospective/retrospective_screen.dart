import 'package:flutter/material.dart';
import 'package:sticky_session_app/Sreens/Retrospective/widget/body.dart';
import 'package:sticky_session_app/constants.dart';

class RetrospectiveScreen extends StatefulWidget {
  const RetrospectiveScreen({Key? key}) : super(key: key);

  get isRecent => null;

  @override
  State<RetrospectiveScreen> createState() => _RetrospectiveScreenState();
}

class _RetrospectiveScreenState extends State<RetrospectiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: kRedColor,
        shadowColor: Colors.grey.shade50,
        title: const Text(
          'Retrospective',
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/sessions/create');
        },
        child: const Icon(Icons.add),
      ),
      body: const Body(),
    );
  }
}
