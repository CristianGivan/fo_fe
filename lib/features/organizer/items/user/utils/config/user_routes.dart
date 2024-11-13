import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
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
            final AddUserActionEnum addUserAction = state.extra as AddUserActionEnum;
            return NoTransitionPage(
              child: UserSignUpScreen(action: addUserAction),
            );
          },
        ),
      ],
    );
  }
}
