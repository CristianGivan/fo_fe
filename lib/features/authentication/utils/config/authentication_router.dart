import 'package:flutter/material.dart';
import 'package:fo_fe/features/authentication/utils/authentication_exports.dart';
import 'package:go_router/go_router.dart';

import '../../../organizer/items/user/utils/user_exports.dart';

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
            pageBuilder: (context, state) {
              // GoRouter expects the data you pass in the extra parameter to be serializable, meaning it should ideally be simple
              final addUserAction = addUserActionMap[state.extra]!;
              return NoTransitionPage(
                child: UserSignUpScreen(action: addUserAction),
              );
            }),
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
