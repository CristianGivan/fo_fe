import 'package:fo_fe/features/authentication/utils/auth_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_list_page.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_management_actions_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocBuilder<AuthLogBloc, AuthLogBlocState>(
        builder: (context, state) {
          if (state is AuthAuthenticatedBlocState) {
            final userId = state.userEntity.id;
            context.read<TaskBlocTask>().add(GetTaskItemsFromLogInUserBlocEvent(userId));

            return const Column(
              children: [
                Center(child: Text('All Tasks:')),
                Expanded(
                  child: TaskListPage(),
                ),
                TaskManagementActionsPage(),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
