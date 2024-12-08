import 'package:fo_fe/features/app_home/utils/app_home_exports.dart';
import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_management_actions_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(title: 'Task Management'),
      body: BlocBuilder<AuthLogBloc, AuthLogBlocState>(
        builder: (context, state) {
          if (state is AuthAuthenticatedBlocState) {
            final userId = state.userEntity.id;
            context.read<TaskBloc>().add(GetTaskItemsFromLogInUserBlocEvent(userId));
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('All Tasks:')),
                ),
                Expanded(
                  child: TaskListPage(), // TaskListPage dynamically adjusts height
                ),
              ],
            );

            //todo -improve- else should be a error maybe
          } else {
            // Show a loader if not authenticated
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 56.0, // Fixed height for AppBottomBarPage
        child: AppBottomBarPage(
          leftMenuOptions: TaskManagementActionsPage.getMenuItems(context),
          onSearchSubmitted: () {
            // Handle search action
          },
          rightMenuOptions: TaskManagementActionsPage.getMenuItems(context),
        ),
      ),
    );
  }
}
