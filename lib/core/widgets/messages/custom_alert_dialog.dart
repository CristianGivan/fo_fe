import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  const CustomAlertDialog({
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onButtonPressed,
    this.titleStyle,
    this.contentStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: titleStyle),
      content: Text(content, style: contentStyle),
      actions: [
        TextButton(
          child: Text(buttonText),
          onPressed: onButtonPressed,
        ),
      ],
    );
  }
}
