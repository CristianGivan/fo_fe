import 'package:flutter/material.dart';
import 'package:fo_fe/app_main.dart';
import 'package:fo_fe/core/config/app_init.dart';

Future<void> main() async {
  appInit(isDev: true);
  runApp(const AppMain());
}
