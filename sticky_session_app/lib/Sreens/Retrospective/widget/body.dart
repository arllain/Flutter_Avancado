import 'package:flutter/material.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/widgets/icon_row.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F3),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 135,
                      color: kLightPurpleColor,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 10,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Starfish ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Icon(Icons.more_vert)
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque consequat ut lorem quis consectetur.",
                                maxLines: 2,
                                style: TextStyle(
                                  color: kGrayColor,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            const IconRow(
                                isRecent: false,
                                icon: Icons.message,
                                text: "6 responses"),
                          ],
                        ))
                  ],
                ),
              )),
          itemCount: 2,
          shrinkWrap: true,
        ),
      ]),
    );
  }
}
