import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/app_main.dart';
import 'package:fo_fe/core/config/app_init.dart';
import 'package:fo_fe/functions/simple_bloc_observer.dart';


Future<void> main() async {
  bool isDev = true;
  WidgetsFlutterBinding.ensureInitialized();
  appInit(isDev: isDev);
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMain());
}
