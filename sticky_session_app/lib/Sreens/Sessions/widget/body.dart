import 'package:flutter/cupertino.dart';
import 'package:sticky_session_app/constants.dart';

import 'meeting_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrayBackGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Recents",
              style:
                  TextStyle(color: kDarkGrayColor, fontWeight: FontWeight.bold),
            ),
          ),
          const MeetingCard(isRecent: true),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Older",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF929292)),
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) => const MeetingCard(isRecent: false),
            itemCount: 1,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
