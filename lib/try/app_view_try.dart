import 'package:flutter/material.dart';

import '../core/router/routes/app_route_configuration.dart';
import '../core/themes/app_themes.dart';

class AppViewTry extends StatelessWidget {
  const AppViewTry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme(),
      routerConfig: AppRouter.returnRouter(),
    );
  }
}
