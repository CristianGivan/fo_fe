import 'package:flutter/material.dart';

import 'core/routes/app_route_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool isAuth = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.returnRouter(isAuth),
      theme: ThemeData.dark(),
    );
  }
}
