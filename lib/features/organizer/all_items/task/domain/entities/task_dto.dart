import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskDto extends ItemEntity {
  final TaskEntity task;
  final TaskUserLinkEntity taskUserLink;

  TaskDto({
    required this.task,
    required this.taskUserLink,
  }) : super(
          id: task.id,
          remoteId: task.remoteId,
        );

  TaskDto copyWith({
    TaskEntity? task,
    TaskUserLinkEntity? taskUserLink,
  }) {
    return TaskDto(
      task: task ?? this.task,
      taskUserLink: taskUserLink ?? this.taskUserLink,
    );
  }

  @override
  List<Object?> get props => [task, taskUserLink];
}
