import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/core/widgets/menu/navigation_menu.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/config/reminder_route_names.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/config/user_route_names.dart';
import 'package:fo_fe/features/organizer/utils/other/Item_strings/organizer_strings.dart';

class OrganizerHomeScreen extends StatelessWidget {
  const OrganizerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: OrganizerStrings().screenTitle,
      body: (userId) => NavigationMenu(buttons: _buildButtons(context)),
      menuOptions: (context, userId) => [],
      onSearchSubmitted: () {},
    );
  }

  List<MenuButton> _buildButtons(BuildContext context) {
    return [
      MenuButton(
        title: 'Go to the topics screen',
        onPressed: () => context.pushNamed(TaskRouterNames.taskRouteName),
      ),
      MenuButton(
        title: 'Go to the tasks screen',
        onPressed: () => context.pushNamed(TaskRouterNames.taskRouteName),
      ),
      MenuButton(
        title: 'Go to the reminder screen',
        onPressed: () => context.pushNamed(ReminderRouterNames.reminderRouteName),
      ),
      MenuButton(
        title: 'Go to the tags screen',
        onPressed: () => context.pushNamed(TagRouterNames.tagRouteName),
      ),
      MenuButton(
        title: 'Go to the users screen',
        onPressed: () => context.pushNamed(UserRouterNames.userRouteName),
      ),
      MenuButton(
        title: 'Go to the authentication screen',
        onPressed: () => context.pushNamed(AuthRouterNames.authRouteName),
      ),
    ];
  }
}
