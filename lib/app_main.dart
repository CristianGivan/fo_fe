import 'package:flutter/material.dart';
import 'package:fo_fe/app_view.dart';
import 'package:fo_fe/core/config/app_providers_bloc.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return appBlocProviders(child: const AppView());
  }
}
