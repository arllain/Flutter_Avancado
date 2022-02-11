import 'package:flutter/material.dart';
import 'package:sticky_session_app/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SessionCreateScreen extends StatefulWidget {
  const SessionCreateScreen({Key? key}) : super(key: key);

  @override
  State<SessionCreateScreen> createState() => _SessionCreateScreenState();
}

class _SessionCreateScreenState extends State<SessionCreateScreen> {
  var textControllerTitle = TextEditingController();
  var textControllerDescription = TextEditingController();

  var isButtonEnabled = false;
  var isLoading = false;

  List<Color> colors = [
    const Color(0xff9b2bb8),
    const Color(0xff546ca9),
    const Color(0xff2fa9e4),
    const Color(0xfff37047),
    const Color(0xff217f4e),
    const Color(0xff4cb684),
    const Color(0xffe59089),
    const Color(0xffd42a2a),
    const Color(0xff636363),
    const Color(0xff8490c8),
    const Color(0xfff5c84e),
    const Color(0xff448aff),
  ];

  Color selectedColor = const Color(0xff9b2bb8);

  void updateButtonStatus() {
    setState(() {
      isButtonEnabled = textControllerTitle.text.isNotEmpty &&
          textControllerDescription.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    textControllerTitle.addListener(() => updateButtonStatus());
    textControllerDescription.addListener(() => updateButtonStatus());
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            width: 50,
            color: Colors.white,
            child: const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            )))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: kRedColor,
              shadowColor: Colors.grey.shade50,
              title:  Text(
                AppLocalizations.of(context)!.create_session,
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.check,
                      color: isButtonEnabled ? Colors.green : Colors.grey,
                    ),
                    onPressed: () => {
                          //
                        }),
              ],
            ),
            body: Container(
              color: const Color(0xFFF3F3F3),
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.session_title,
                    ),
                    controller: textControllerTitle,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.session_description,
                    ),
                    maxLength: 30,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: textControllerDescription,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.select_a_color,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                      children: [
                        for (var color in colors)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: color),
                              padding: const EdgeInsets.all(8),
                              child: selectedColor == color
                                  ? Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withAlpha(150)),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
