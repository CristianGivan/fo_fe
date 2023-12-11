part of authentication;

class AuthenticationAppBranch {
  static StatefulShellBranch branch(
    GlobalKey<NavigatorState> navigatorKey,
    bool isAuth,
  ) {
    return StatefulShellBranch(
      navigatorKey: navigatorKey,
      routes: [
        route(isAuth),
      ],
    );
  }

  static GoRoute route(bool isAuth) {
    return GoRoute(
      name: AuthenticationRouterNames.authenticationRoute,
      path: AuthenticationRouterNames.authenticationRoute,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: AuthenticationScreen()),
      routes: [
        GoRoute(
          name: AuthenticationRouterNames.authenticationRegisterRoute,
          path: AuthenticationRouterNames.registerRouteName,
          builder: (context, state) => const AuthenticationScreen(),
        ),
      ],
    );
  }
}
