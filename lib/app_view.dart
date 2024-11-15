import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/config/app_routes.dart';
import 'package:fo_fe/core/themes/app_themes.dart';

import 'features/authentication/utils/authentication_exports.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationSignBloc>().add(AuthSignInAutoBlocEvent());
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme(),
      routerConfig: AppRouter.returnRouter(),
    );
  }
}
