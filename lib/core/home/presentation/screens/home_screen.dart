import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_screen.dart';

class HomeScreen extends StatelessWidget {
   const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return BlocProvider(
            create: (context) => SignInBloc(
                userRepository:
                    context.read<AuthenticationBloc>().userRepository),
            child:  AppScreen(),
          );
        } else {
          return const AuthenticationScreen();
        }
      }),
    );
  }
}
