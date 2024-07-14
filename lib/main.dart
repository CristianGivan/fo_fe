import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/service_locator.dart' as sl;

import 'app_main.dart';
import 'functions/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sl.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMain());
}
