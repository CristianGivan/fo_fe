import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/config/app_providers_bloc.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/try/temp/app_view_temp.dart';
import 'package:fo_fe/try/temp/getIt2.dart';
import 'package:get_it/get_it.dart';

void main() {
  init2();
  runApp(const MyAppMain3());
}

class MyAppMain3 extends StatelessWidget {
  const MyAppMain3({super.key});

  @override
  Widget build(BuildContext context) {
    return appBlocProviders(child: const AuthenticationScreen());
  }
}

class MyAppMain extends StatelessWidget {
  const MyAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBlocSignUp(
        signUpUseCase: GetIt.instance<SignUpUseCase>(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const AuthenticationScreen(),
      ),
    );
  }
}

class MyAppMain1 extends StatelessWidget {
  const MyAppMain1({super.key});

  @override
  Widget build(BuildContext context) {
    return test1(child: const AppViewTemp());
  }

  BlocProvider<AuthenticationBlocSignUp> test1({
    required Widget child,
  }) {
    return BlocProvider(
        create: (context) => AuthenticationBlocSignUp(
              signUpUseCase: GetIt.instance<SignUpUseCase>(),
            ),
        child: child);
  }
}

class MyAppMain2 extends StatelessWidget {
  const MyAppMain2({super.key});

  @override
  Widget build(BuildContext context) {
    return test2(child: const AppViewTemp());
  }
}

BlocProvider<AuthenticationBlocSignUp> test2({
  required Widget child,
}) {
  return BlocProvider(
      create: (context) => AuthenticationBlocSignUp(
            signUpUseCase: GetIt.instance<SignUpUseCase>(),
          ),
      child: child);
}
