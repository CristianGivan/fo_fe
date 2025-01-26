import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/get_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/update_task_link_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskUserLinksBloc extends OrganizerLinkBloc<UserEntity> {
  TaskUserLinksBloc({
    required GetTaskLinkUseCase<UserEntity> getTaskUserUseCase,
    required UpdateTaskLinkUseCase<UserEntity> updateTaskUserUseCase,
  }) : super(
          getItemsLinked: getTaskUserUseCase,
          updateItemsLinked: updateTaskUserUseCase,
        ) {
    setupEventHandlers();
  }
}
