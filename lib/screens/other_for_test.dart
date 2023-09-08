import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class OtherForTest extends StatefulWidget {
  static String routeName = '/phone';
  const OtherForTest({Key? key}) : super(key: key);

  @override
  State<OtherForTest> createState() => _OtherForTestState();
}

class _OtherForTestState extends State<OtherForTest> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: phoneController,
            hintText: 'test',
          ),
          CustomButton(
            onTap: () {
              // context
              //     .read<FirebaseAuthMethods>()
              //     .phoneSignIn(context, phoneController.text);
            },
            text: 'OK',
          ),
        ],
      ),
    );
  }
}
