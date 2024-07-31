import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/core/config/app_init.dart';
import 'package:fo_fe/core/del/stateful_route_shell_old.dart';
import 'package:fo_fe/core/themes/app_themes.dart';
import 'package:fo_fe/features/authentication/config/authentication_exports.dart';
import 'package:fo_fe/features/organizer/config/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/logic/task_bloc/task_bloc.dart';
import 'package:fo_fe/try/UI/add_task_screen.dart';
import 'package:fo_fe/try/UI/task_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../functions/simple_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  appInit();
  Bloc.observer = SimpleBlocObserver();
  runApp(const AppMain());
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return appBlocProviders(child: const AppView());
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme(),
      routerConfig: AppRouter.returnRouter(),
    );
  }
}

MultiBlocProvider appBlocProviders({
  required Widget child,
}) {
  return MultiBlocProvider(
    providers: [
      ...getOrganizerBlocProviders(),
      ...getAuthenticationBlocProviders()
    ],
    child: child,
  );
}

List<BlocProvider> getOrganizerBlocProviders() {
  return [
    BlocProvider<TaskBlocTask>(
      create: (_) => GetIt.instance<TaskBlocTask>(),
    ),
    BlocProvider<TaskBlocUser>(
      create: (_) => GetIt.instance<TaskBlocUser>(),
    ),
    BlocProvider<TaskBlocTag>(
      create: (_) => GetIt.instance<TaskBlocTag>(),
    ),
    BlocProvider<TaskBlocReminder>(
      create: (_) => GetIt.instance<TaskBlocReminder>(),
    ),
    // Add more BlocProviders as needed
  ];
}

List<BlocProvider> getAuthenticationBlocProviders() {
  return [
    BlocProvider<AuthenticationBlocSession>(
      create: (_) => GetIt.instance<AuthenticationBlocSession>(),
    ),
    BlocProvider<AuthenticationBlocToken>(
      create: (_) => GetIt.instance<AuthenticationBlocToken>(),
    ),
    BlocProvider<AuthenticationBlocSignUp>(
      create: (_) => GetIt.instance<AuthenticationBlocSignUp>(),
    ),
    BlocProvider<AuthenticationBlocSignIn>(
      create: (_) => GetIt.instance<AuthenticationBlocSignIn>(),
    ),
  ];
}

// app_route_try.dart

final _organizerShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'organizer');
final _authShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'auth');

class AppRouter {
  static GoRouter returnRouter() {
    GoRouter router = GoRouter(
      initialLocation:
          AuthenticationRouterNames.authenticationWithAutoLogInRoute,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                //todo cg is needed?
                navigationShell: navigationShell);
          },
          branches: [
            OrganizerAppBranch.branch(_organizerShellNavigatorKey),
            AuthenticationAppBranch.branch(_authShellNavigatorKey),
          ],
        ),
      ],
    );
    return router;
  }
}

class OrganizerAppBranch {
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
      name: OrganizerRouterNames.organizerRoute,
      path: '/organizer',
      pageBuilder: (context, state) => NoTransitionPage(
        child: OrganizerHome(),
        // This is the root screen for the organizer
      ),
      routes: [
        GoRoute(
          name: OrganizerRouterNames.organizerTaskRoute,
          path: 'task', // Relative path for nesting
          pageBuilder: (context, state) => NoTransitionPage(
            child: TaskScreen(),
          ),
          routes: [
            GoRoute(
              name: OrganizerRouterNames.organizerTaskAddTaskRoute,
              path: OrganizerRouterNames.organizerTaskAddTaskName,
              pageBuilder: (context, state) => NoTransitionPage(
                child: AddTaskScreen(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
