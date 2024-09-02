import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/app_main.dart';
import 'package:fo_fe/core/config/app_init.dart';

import '../functions/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appInit();
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMain());
}
