import 'package:fo_fe/features/organizer/all_items/task/domain/entities/task_tag_link_entity.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';

class TaskDto extends DtoEntity {
  final TaskEntity task;
  final TaskUserLinkEntity taskUserLink;
  final TaskTagLinkEntity? taskTagLink;

  TaskDto({
    required this.task,
    required this.taskUserLink,
    this.taskTagLink,
  }) : super(
          entity: task,
          userLink: taskUserLink,
        );

  TaskDto copyWith({
    TaskEntity? task,
    TaskUserLinkEntity? taskUserLink,
    TaskTagLinkEntity? taskTagLink,
  }) {
    return TaskDto(
      task: task ?? this.task,
      taskUserLink: taskUserLink ?? this.taskUserLink,
      taskTagLink: taskTagLink ?? this.taskTagLink,
    );
  }

  @override
  List<Object?> get props => [task, taskUserLink, taskTagLink];
}
