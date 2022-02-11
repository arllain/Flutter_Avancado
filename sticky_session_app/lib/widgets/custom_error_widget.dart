import 'package:flutter/material.dart';

import '../constants.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final Icon icon;

  const CustomErrorWidget({
    Key? key,
    required this.message,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            message,
            style: const TextStyle(color: kDarkGrayColor, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
