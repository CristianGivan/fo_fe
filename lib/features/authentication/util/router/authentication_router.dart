import 'package:flutter/material.dart';
import 'package:fo_fe/features/authentication/authentication_exports.dart';
import 'package:fo_fe/features/authentication/util/router/authentication_router_names.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/authentication_screen_with_auto_log_in.dart';

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
        GoRoute(
          name: AuthenticationRouterNames.authenticationWithAutoLogInRoute,
          path: 'authenticationWithAutoLogIn',
          pageBuilder: (context, state) => NoTransitionPage(
            child: AuthenticationScreenWithAutoLogIn(),
          ),
        )
      ],
    );
  }
}
