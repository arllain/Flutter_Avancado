import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: const TextField(
        maxLines: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Write a note...',
          contentPadding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
