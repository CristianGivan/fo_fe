import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserRoutes {
  static GoRoute routes() {
    return GoRoute(
      name: UserRouterNames.userRoute,
      path: 'user',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: UserScreen(),
      ),
      routes: [
        GoRoute(
          name: UserRouterNames.addUsersFromAllUsersRoute,
          path: 'add-users:userId',
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            final userId = int.parse(state.pathParameters['userId']!);
            return NoTransitionPage(
              child: AddUsersFromAllUsersScreen(userId: userId),
            );
          },
        ),
      ],
    );
  }
}
