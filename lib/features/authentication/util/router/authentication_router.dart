import 'package:flutter/material.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/util/router/authentication_router_names.dart';
import 'package:go_router/go_router.dart';

class AuthenticationAppBranch {
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
      name: AuthenticationRouterNames.authenticationRoute,
      path: '/authentication',
      pageBuilder: (context, state) => NoTransitionPage(
        child: AuthenticationScreen(),
      ),
      routes: [
        GoRoute(
          name: AuthenticationRouterNames.signInRoute,
          path: 'sign-in',
          pageBuilder: (context, state) => NoTransitionPage(
            child: SignInScreen(),
          ),
        ),
        GoRoute(
          name: AuthenticationRouterNames.signUpRoute,
          path: 'sign-up',
          pageBuilder: (context, state) => NoTransitionPage(
            child: SignUpScreen(),
          ),
        ),
      ],
    );
  }
}
