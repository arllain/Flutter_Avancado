import 'package:flutter/material.dart';
import 'package:sticky_session_app/widgets/background.dart';
import 'package:sticky_session_app/widgets/custom_button.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This size provides us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            Image.asset("assets/icons/logo_symbol.png"),
            SizedBox(height: size.height * 0.02),
             Text(
                AppLocalizations.of(context)!.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            SizedBox(height: size.height * 0.25),
            CustomButton(
              text: AppLocalizations.of(context)!.logInWithGmail,
              color: kRedColor,
              textColor: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              press: () {},
            ),
            CustomButton(
              text: AppLocalizations.of(context)!.logInWithToken,
              color: kPurpleColor,
              textColor: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              press: () {
                Navigator.pushNamed(context, loginTokenRouter);
              },
            ),
          ],
        ),
      ),
    );
  }
}
