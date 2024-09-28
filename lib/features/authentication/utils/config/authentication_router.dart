import 'package:flutter/material.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
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
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AuthenticationScreen(),
      ),
      routes: [
        GoRoute(
          name: AuthenticationRouterNames.signInRoute,
          path: 'sign-in',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SignInScreen(),
          ),
        ),
        GoRoute(
          name: AuthenticationRouterNames.signUpRoute,
          path: 'sign-up',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SignUpScreen(),
          ),
        ),
        GoRoute(
          name: AuthenticationRouterNames.authenticationWithAutoLogInRoute,
          path: 'authenticationWithAutoLogIn',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AuthenticationScreenWithAutoLogIn(),
          ),
        )
      ],
    );
  }
}
