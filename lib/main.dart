import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/main_init.dart';

import 'app_main.dart';
import 'functions/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMain());
}
