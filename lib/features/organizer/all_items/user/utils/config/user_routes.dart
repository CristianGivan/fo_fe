import 'package:fo_fe/features/organizer/all_items/user/presentation/screens/user_add_screen.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: UserRouterNames.userRoutePath,
      name: UserRouterNames.userRouteName,
      pageBuilder: (context, state) {
        final userItems = state.extra as OrganizerItems<UserEntity>?;
        return MaterialPage(
          child: UserScreen(userItems: userItems ?? OrganizerItems.empty()),
        );
      },
      routes: [
        GoRoute(
          path: UserRouterNames.userAddRoutePath,
          name: UserRouterNames.userAddRouteName,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: UserAddScreen(),
            );
          },
        ),
      ],
    );
  }
}
