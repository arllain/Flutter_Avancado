import 'package:flutter/material.dart';

class ReleaseVersion extends StatelessWidget {
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const ReleaseVersion({
    Key? key,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return newPositioned();
  }

  Widget newPositioned() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "v 01.00.00",
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
