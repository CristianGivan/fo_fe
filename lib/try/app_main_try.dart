import 'package:flutter/material.dart';
import 'package:fo_fe/core/router/routes/app_bloc_providers.dart';
import 'package:fo_fe/try/app_view_try.dart';

class AppMainTry extends StatelessWidget {
  const AppMainTry({super.key});

  @override
  Widget build(BuildContext context) {
    return appBlocProviders(child: const AppViewTry());
  }
}
