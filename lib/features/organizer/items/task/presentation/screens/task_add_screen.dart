import 'package:fo_fe/features/app_home/presentation/pages/app_bar_page.dart';
import 'package:fo_fe/features/authentication/presentation/bloc/auth_log_bloc/auth_log_bloc.dart';
import 'package:fo_fe/features/authentication/presentation/widget/auth_content_widget.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_add_form.dart';

import '../../../../../../core/utils/exports/external_exports.dart';
import '../../utils/task_exports.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: TaskStrings().screenAddTitle),
      body: AuthenticatedContentWidget(contentBuilder: _buildTaskAddForm),
    );
  }

  Widget _buildTaskAddForm(AuthAuthenticatedBlocState state, BuildContext context) {
    final userId = state.userEntity.id;
    return TaskAddForm(loggedInUserId: userId);
  }
}
