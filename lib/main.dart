import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fo_fe/app_main.dart';
import 'package:user_repository/user_repository.dart';

import 'functions/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(AppMain(FirebaseUserRepository()));
}
