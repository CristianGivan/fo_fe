import 'dart:math';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/app_main.dart';

import 'core/db/objectbox/objectbox.dart';
import 'functions/firebase_options.dart';
import 'functions/simple_bloc_observer.dart';
late ObjectBox objectbox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();

  objectbox = await ObjectBox.create();
  runApp(AppMain(FirebaseUserRepository()));
  // todo
  // objectbox.store.close();
}
