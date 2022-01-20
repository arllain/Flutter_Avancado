import 'package:flutter/material.dart';
import 'package:sticky_session_app/widgets/text_field_container.dart';

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool? alignLabelWithHint;
  final String textLabel;
  final Color color;
  final ValueChanged<String> onChanged;

  const CustomInputField({
    Key? key,
    this.icon,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    this.alignLabelWithHint,
    required this.textLabel,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: textLabel,
            alignLabelWithHint: alignLabelWithHint),
      ),
    );
  }
}
