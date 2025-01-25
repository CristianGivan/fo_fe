import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

void updateTaskUserLink(BuildContext context, TaskDto taskDto, bool value) {
  final updatedTaskUserLink = taskDto.taskUserLink.copyWith(isSelectedByUser: value);
  context.read<OrganizerBloc<TaskDto>>().add(UpdateTaskBlocEvent(TaskParams(
        id: taskDto.id,
        taskDto: taskDto,
        taskUserLinkEntity: updatedTaskUserLink,
      )));
}
