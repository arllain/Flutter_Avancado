import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/widgets/background.dart';
import 'package:sticky_session_app/widgets/custom_button.dart';
import 'package:sticky_session_app/widgets/custom_input_field.dart';
import 'package:sticky_session_app/widgets/release_version.dart';

class LoginTokenScreen extends StatefulWidget {
  const LoginTokenScreen({Key? key}) : super(key: key);

  @override
  State<LoginTokenScreen> createState() => _LoginTokenScreenState();
}

class _LoginTokenScreenState extends State<LoginTokenScreen> {
  var textControllerToken = TextEditingController();
  var textControllerUsername = TextEditingController();

  var isButtonEnabled = true;

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = true;
      // isButtonEnabled = textControllerToken.text.isNotEmpty &&
      //     textControllerUsername.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    textControllerToken.addListener(() => updateButtonStatus());
    textControllerUsername.addListener(() => updateButtonStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                width: MediaQuery.of(context).size.width * 0.95,
                child: const Text(
                  "If you do not have a token, ask for meeting admin",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              CustomInputField(
                textLabel: "Token",
                color: Colors.black,
                onChanged: (value) {},
                controller: textControllerToken,
              ),
              CustomInputField(
                textLabel: "Username",
                color: Colors.black,
                onChanged: (value) {},
                controller: textControllerUsername,
              ),
              CustomButton(
                text: "Log In",
                color: isButtonEnabled ? kRedColor : kDesabledColor,
                textColor: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                press: isButtonEnabled
                    ? () => {
                          Navigator.pushNamed(context, sessionsRouter),
                        }
                    : () => {},
              ),
              const SizedBox(
                height: 145,
              ),
              const ReleaseVersion(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  textColor: kLightGrayColor),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Log In with the token",
        style: TextStyle(
            color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.white,
      foregroundColor: kRedColor,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }
}
