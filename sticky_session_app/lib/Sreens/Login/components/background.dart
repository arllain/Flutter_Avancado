import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            bottom: 5,
            child: Text(
              "v 01.00.00",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          child
        ],
      ),
    );
  }
}
