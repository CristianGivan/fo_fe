import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:get_it/get_it.dart';

Widget multiBlocProvider({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBlocSignUp(
          signUpUseCase: GetIt.instance<SignUpUseCase>(),
        ),
      ),
      // Add other BlocProviders here as needed
    ],
    child: child,
  );
}
