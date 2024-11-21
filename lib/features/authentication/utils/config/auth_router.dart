import 'package:flutter/material.dart';
import 'package:fo_fe/features/app_home/presentation/screens/app_home_screen.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:go_router/go_router.dart';

class AuthAppBranch {
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
      name: AuthRouterNames.authRouteName,
      path: AuthRouterNames.authRoutePath,
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AuthScreen(),
      ),
      routes: [
        GoRoute(
          path: AuthRouterNames.authSignInRoutePath,
          name: AuthRouterNames.authSignInRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SignInScreen(),
          ),
        ),
        GoRoute(
            path: AuthRouterNames.authSignUpRoutePath,
            name: AuthRouterNames.authSignUpRouteName,
            pageBuilder: (context, state) {
              // GoRouter expects the data you pass in the extra parameter to be serializable, meaning it should ideally be simple
              return const NoTransitionPage(child: UserSignUpScreen());
            }),
        GoRoute(
          path: AuthRouterNames.authWithAutoLogInRoutePath,
          name: AuthRouterNames.authWithAutoLogInRouteName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: AppHomeScreen(),
          ),
        )
      ],
    );
  }
}
