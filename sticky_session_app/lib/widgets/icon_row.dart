import 'package:flutter/material.dart';

class IconRow extends StatefulWidget {
  final bool isRecent;
  final IconData icon;
  final String text;

  const IconRow(
      {Key? key,
      required this.isRecent,
      required this.icon,
      required this.text})
      : super(key: key);

  @override
  State<IconRow> createState() => _IconRowState();
}

class _IconRowState extends State<IconRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                color:
                    (widget.isRecent ? Colors.white : Colors.red).withAlpha(70),
                shape: BoxShape.circle),
            child: Padding(
                padding: const EdgeInsets.all(6),
                child: Icon(
                  widget.icon,
                  color: widget.isRecent ? Colors.white : Colors.red,
                  size: 18,
                ))),
        const SizedBox(
          width: 8,
        ),
        Text(widget.text,
            style:
                TextStyle(color: widget.isRecent ? Colors.white : Colors.red)),
      ],
    );
  }
}
