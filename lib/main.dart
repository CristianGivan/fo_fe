import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/injection_container.dart' as di;

import 'app_main.dart';
import 'core/db/database.dart';
import 'functions/simple_bloc_observer.dart';

late Database database;

Future<void> main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMain());

  // switch (Platform.operatingSystem) {
  //   case "android":
  //     {
  //       database = await ObjectBox.create();
  //       await Firebase.initializeApp(
  //           options: DefaultFirebaseOptions.currentPlatform);
  //       runApp(AppMainOld(FirebaseUserRepository()));
  //     }
  //     break;
  //   case "windows":
  //     {
  //       database = await ObjectBox.create();
  //       runApp(AppMainOld(LocalUserRepository()));
  //     }
  //     break;
  //   case "linux":
  //     {
  //       database = await ObjectBox.create();
  //       runApp(AppMainOld(LocalUserRepository()));
  //     }
  //     break;
  //   default: // web
  //     {
  //       database = await ObjectBox.create();
  //       await Firebase.initializeApp(
  //           options: DefaultFirebaseOptions.currentPlatform);
  //       runApp(AppMainOld(FirebaseUserRepository()));
  //     }
  //     break;
  // }

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
