import 'package:flutter/material.dart';

import '../constants.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: kDarkGrayColor),
          Text(
            message,
            style: const TextStyle(color: kDarkGrayColor, fontSize: 17),
          ),
        ],
      ),
    );
  }
}
