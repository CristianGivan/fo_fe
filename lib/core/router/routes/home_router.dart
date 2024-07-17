import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../home/presentation/screens/home_screen.dart';
import 'app_route_constants.dart';

class HomeAppBranch {
  static StatefulShellBranch branch(GlobalKey<NavigatorState> navigatorKey) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        route(),
      ],
    );
  }

  static GoRoute route() {
    return GoRoute(
      name: RouteCoreConstants.homeRouteName,
      path: RouteCoreConstants.homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    );
  }
}
