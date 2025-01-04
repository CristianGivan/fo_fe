import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class TaskDto extends DtoEntity {
  final TaskEntity task;
  final TaskUserLinkEntity taskUserLink;

  TaskDto({
    required this.task,
    required this.taskUserLink,
  }) : super(
          id: task.id,
          remoteId: task.remoteId,
          subject: task.subject,
          isSelectedByUser: taskUserLink.isSelectedByUser,
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
