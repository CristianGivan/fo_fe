import 'package:flutter/material.dart';
import 'package:fo_fe/core/themes/app_themes.dart';
import 'core/router/routes/app_route_configuration.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  // todo add in a check box
  final bool showMenu = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme(),
      routerConfig: AppRouter.returnRouter(),
      //
    );
  }
}
