import 'package:flutter/material.dart';
import 'package:fo_fe/try/temp/getIt2.dart';
import 'package:fo_fe/try/temp/sign_up_screen1.dart';

void main() {
  init2();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen1(),
    );
  }
}
