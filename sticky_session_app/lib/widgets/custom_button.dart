import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton({
    Key? key,
    required this.press,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.95,
      child: ClipRRect(
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: () {
        press();
      },
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight)),
    );
  }
}
