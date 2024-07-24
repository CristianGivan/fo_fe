import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/router/routes/app_bloc_providers.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/try/temp/app_view_temp.dart';
import 'package:fo_fe/try/temp/getIt2.dart';
import 'package:get_it/get_it.dart';

void main() {
  init2();
  runApp(MyAppMain3());
}

class MyAppMain3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return appBlocProviders(child: AuthenticationScreen());
  }
}

class MyAppMain extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return test1(child: AppViewTemp());
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
  @override
  Widget build(BuildContext context) {
    return test2(child: AppViewTemp());
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
