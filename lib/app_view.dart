import 'package:flutter/material.dart';
import 'package:fo_fe/core/config/app_routes.dart';
import 'package:fo_fe/core/themes/app_themes.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme(),
      routerConfig: AppRouter.returnRouter(),
    );
  }
}
