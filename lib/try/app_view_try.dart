import 'package:flutter/material.dart';
import 'package:fo_fe/core/router/routes/app_bloc_providers.dart';
import 'package:fo_fe/core/router/routes/app_route_try.dart';
import 'package:fo_fe/core/themes/app_themes.dart';

class AppViewTry extends StatelessWidget {
  const AppViewTry({super.key});

  @override
  Widget build(BuildContext context) {
    return appBlocProviders(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.darkTheme(),
        routerConfig: AppRouterTry.returnRouter(),
      ),
    );
  }
}
