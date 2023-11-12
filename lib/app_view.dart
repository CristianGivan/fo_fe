import 'package:flutter/material.dart';

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
      routerConfig: AppRouter.returnRouter(showMenu, isAuth),
      theme: ThemeData.dark(),
    );
  }
}
