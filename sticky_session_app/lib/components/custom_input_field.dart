import 'package:flutter/material.dart';
import 'package:sticky_session_app/components/text_field_container.dart';

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final String textLabel;
  final Color color;
  final ValueChanged<String> onChanged;

  const CustomInputField({
    Key? key,
    this.icon,
    required this.textLabel,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: textLabel,
        ),
      ),
    );
  }
}
