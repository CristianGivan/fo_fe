import 'package:flutter/material.dart';
import 'package:fo_fe/try/temp/sign_up_screen1.dart';

class AppViewTemp extends StatelessWidget {
  const AppViewTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: SignUpScreen1(),
    );
  }
}
