part of authentication;

class AuthenticationAppBranch {
  static StatefulShellBranch branch(
    GlobalKey<NavigatorState> navigatorKey,
  ) {
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
