import 'package:flutter/material.dart';
import 'package:fo_fe/screens/login_screen.dart';
import 'package:fo_fe/screens/other_for_test.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class HomePageScreen extends StatefulWidget {
  static String routeName = '/home-page';
  const HomePageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              text: 'Login',
            ),
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, OtherForTest.routeName);
                },
                text: 'Other'),
            CustomTextField(
              controller: phoneController,
              hintText: 'Find command',
            ),
          ],
        ),
      ),
    );
  }
}
