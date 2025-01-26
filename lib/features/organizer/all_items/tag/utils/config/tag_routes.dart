import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/presentation/screen/tag_add_screen.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagRoutes {
  static GoRoute routes() {
    return GoRoute(
      path: TagRouterNames.tagRoutePath,
      name: TagRouterNames.tagRouteName,
      pageBuilder: (context, state) {
        return MaterialPage(child: ItemScreen<TagDto>());
      },
      routes: [
        GoRoute(
          path: TagRouterNames.tagAddRoutePath,
          name: TagRouterNames.tagAddRouteName,
          pageBuilder: (context, state) {
            // Accessing 'userId' from state.pathParameters
            return const NoTransitionPage(child: TagAddScreen());
          },
        ),
      ],
    );
  }
}
