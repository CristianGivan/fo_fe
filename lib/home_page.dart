import 'package:flutter/material.dart';
import 'package:fo_fe/screens/home_page_screen.dart';
import 'package:fo_fe/screens/login_email_password_screen.dart';
import 'package:fo_fe/screens/login_screen.dart';
import 'package:fo_fe/screens/other_for_test.dart';
import 'package:fo_fe/screens/phone_screen.dart';
import 'package:fo_fe/screens/signup_email_password_screen.dart';

class HomePage extends StatelessWidget {
  final ThemeMode themeMode;

  const HomePage({required this.themeMode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: const HomePageScreen(),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        OtherForTest.routeName: (context) => const OtherForTest(),
        EmailPasswordSignup.routeName: (context) => const EmailPasswordSignup(),
        EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
        PhoneScreen.routeName: (context) => const PhoneScreen(),
      },
    );
  }
}
