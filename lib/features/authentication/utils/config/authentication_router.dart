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
      name: AuthenticationRouterNames.authenticationRouteName,
      path: AuthenticationRouterNames.authenticationRoutePath,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AuthenticationScreen(),
      ),
      routes: [
        GoRoute(
          path: AuthenticationRouterNames.authenticationSignInRoutePath,
          name: AuthenticationRouterNames.authenticationSignInRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SignInScreen(),
          ),
        ),
        GoRoute(
          path: AuthenticationRouterNames.authenticationSignUpRoutePath,
          name: AuthenticationRouterNames.authenticationSignUpRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: UserSignUpScreen(),
          ),
        ),
        GoRoute(
          path: AuthenticationRouterNames.authenticationAuthenticationWithAutoLogInRoutePath,
          name: AuthenticationRouterNames.authenticationAuthenticationWithAutoLogInRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AuthenticationScreenWithAutoLogIn(),
          ),
        )
      ],
    );
  }
}
