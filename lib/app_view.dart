import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/other/presentation/screens/hi_screen.dart';
import 'package:fo_fe/core/home/presentation/screens/app_screen.dart';
import 'package:fo_fe/main.dart';

import 'core/router/routes/app_route_configuration.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  final bool isAuth = true;

  // todo add in a check box
  final bool showMenu = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routerConfig: AppRouter.returnRouter(showMenu, isAuth,objectbox),
        //
    );
  }
}
