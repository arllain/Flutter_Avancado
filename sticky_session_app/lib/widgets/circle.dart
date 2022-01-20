import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final int color;
  final VoidCallback onPressed;

  const Circle({Key? key, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Color(color)),
      ),
    );
  }
}
