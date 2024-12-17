import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskDTO extends OrganizerItemBase {
  final TaskEntity task;
  final TaskUserLinkEntity? taskUserData;

  TaskDTO({
    required this.task,
    this.taskUserData,
  }) : super(
          id: task.id,
          remoteId: task.remoteId,
        );

  @override
  List<Object?> get props => [task, taskUserData];
}
