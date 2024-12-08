import 'package:flutter/material.dart';

class SnackBarWidget {
  static void show(
      BuildContext context, String content, Color? backgroundColor, double buttonMargin) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: buttonMargin,
        ),
      ),
    );
  }

  static void showAboveBottomNavBar(BuildContext context,
      {required String content, Color? backgroundColor}) {
    show(context, content, backgroundColor, 55);
  }

  static void showAtBottom(BuildContext context,
      {required String content, Color? backgroundColor}) {
    show(context, content, backgroundColor, 5);
  }
}
