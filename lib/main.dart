import 'dart:io';

import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_main.dart';
import 'core/db/database.dart';

import 'core/db/objectbox/objectbox.dart';
import 'functions/firebase_options.dart';
import 'functions/simple_bloc_observer.dart';

late Database database;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  switch (Platform.operatingSystem) {
    case "android":
      {
        database = await ObjectBox.create();
        await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform);
        runApp(AppMain(FirebaseUserRepository()));
      }
      break;
    case "windows":
      {
        database = await ObjectBox.create();
        runApp(AppMain(LocalUserRepository()));
      }
      break;
    case "linux":
      {
        database = await ObjectBox.create();
        runApp(AppMain(LocalUserRepository()));
      }
      break;
    default: // web
      {
        database = await ObjectBox.create();
        await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform);
        runApp(AppMain(FirebaseUserRepository()));
      }
      break;
  }

  // if (Platform.isAndroid) {
  //   objectbox = await ObjectBox.create();
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  //
  //   runApp(AppMain(FirebaseUserRepository()));
  // } else if (Platform.isWindows) {
  //   objectbox = await ObjectBox.create();
  //   runApp(AppMain(LocalUserRepository()));
  // } else if (Platform.isLinux) {
  //   objectbox = await ObjectBox.create();
  //   runApp(AppMain(LocalUserRepository()));
  // } else {
  //   // web
  //   objectbox = await ObjectBox.create();
  //   await Firebase.initializeApp(
  //       options: DefaultFirebaseOptions.currentPlatform);
  //   runApp(AppMain(FirebaseUserRepository()));
  // }

  // todo
  // objectbox.store.close();
}
