import 'package:fo_fe/features/app_home/presentation/pages/app_bar_page.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/config/reminder_route_names.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/config/user_route_names.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerHomeScreen extends StatelessWidget {
  const OrganizerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarPage(title: 'Organizer'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(TaskRouterNames.taskRouteName),
              child: const Text('Go to the topics screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(TaskRouterNames.taskRouteName),
              child: const Text('Go to the tasks screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(ReminderRouterNames.reminderRouteName),
              child: const Text('Go to the reminder screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(TagRouterNames.tagRouteName),
              child: const Text('Go to the tag screen'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(AuthRouterNames.authRouteName),
              child: const Text('Authentication'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.pushNamed(UserRouterNames.userRouteName),
              child: const Text('User'),
            ),
          ),
          const Center(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
