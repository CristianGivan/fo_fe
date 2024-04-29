import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

OrganizerItems<TaskEntity> getOrganizerItems3Tasks() {
  final TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
  final TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
  final TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");

  return OrganizerItems.of([taskEntity1, taskEntity2, taskEntity3]);
}
