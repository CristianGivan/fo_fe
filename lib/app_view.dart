import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/other/presentation/screens/hi_screen.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  final bool isAuth = true;

  // todo add in a check box
  final bool showMenu = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        // routerConfig: AppRouter.returnRouter(showMenu, isAuth),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => SignInBloc(
                  userRepository:
                      context.read<AuthenticationBloc>().userRepository),
              child: const HiScreeen(),
            );
          } else {
            return const WelcomeScreen();
          }
        }));
  }
}
