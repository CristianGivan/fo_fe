import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/try/temp/getIt.dart';
import 'package:fo_fe/try/temp/sign_up_screen1.dart';
import 'package:get_it/get_it.dart';

void main() {
  init1();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBlocSignUp(
        signUpUseCase: GetIt.instance<SignUpUseCase>(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: SignUpScreen1(),
      ),
    );
  }
}
