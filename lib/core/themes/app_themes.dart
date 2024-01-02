import 'package:flutter/material.dart';

class AppThemes{
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                      (state) => Colors.lightBlue[100]))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                      (state) => Colors.lightBlue[100]))),
    );
  }
}