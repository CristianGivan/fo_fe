import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/routes/app_route_configuration.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  final bool isAuth = true;

  // todo add in a check box
  final bool showMenu = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.returnRouter(showMenu, isAuth),
        theme: ThemeData.dark(),
      ),
    );
  }
}
