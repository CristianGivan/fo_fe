import 'package:flutter/material.dart';

class AppThemes{
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith(
                      (state) => Colors.lightBlue[100]),
          backgroundColor: WidgetStateProperty.resolveWith(
                  (state) => Colors.grey[800]))),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.resolveWith(
                      (state) => Colors.lightBlue[100]),
              backgroundColor: WidgetStateProperty.resolveWith(
                      (state) => Colors.grey[800]))),
    );
  }
}