import 'dart:developer';

import 'package:flutter/material.dart';

import 'Circle.dart';

class SelectedColor extends StatelessWidget {
  const SelectedColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Circle(
              color: 0xff9b2bb8,
              onPressed: () => log("select roxo"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xff217f4e,
              onPressed: () => log("select verde"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xff636363,
              onPressed: () => log("select cinza escuro"),
            ),
          ],
        ),
        Column(
          children: [
            Circle(
              color: 0xff546ca9,
              onPressed: () => log("select azul escuro"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xff4cb684,
              onPressed: () => log("select verde cana"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xff8490c8,
              onPressed: () => log("select lilas"),
            ),
          ],
        ),
        Column(
          children: [
            Circle(
              color: 0xff2fa9e4,
              onPressed: () => log("select azul celeste"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xffe59089,
              onPressed: () => log("select bege"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xfff5c84e,
              onPressed: () => log("select amarelo"),
            ),
          ],
        ),
        Column(
          children: [
            Circle(
              color: 0xfff37047,
              onPressed: () => log("select laranja"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xffd42a2a,
              onPressed: () => log("select vermelho"),
            ),
            const SizedBox(height: 7),
            Circle(
              color: 0xff448aff,
              onPressed: () => log("select azul medio"),
            ),
          ],
        )
      ],
    );
  }
}
