import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

OrganizerItems<TaskEntity> getOrganizerItems3TaskEntity() {
  final TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
  final TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
  final TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");

  return OrganizerItems.of([taskEntity1, taskEntity2, taskEntity3]);
}

OrganizerItems<OrganizerItemEntity> getFiveOrganizerItemEntity() {
  final OrganizerItemEntity organizerItemEntity1 =
      OrganizerItemEntity(id: 1, subject: "OrganizerItemEntity1", remoteId: 1);
  final OrganizerItemEntity organizerItemEntity2 =
      OrganizerItemEntity(id: 2, subject: "OrganizerItemEntity2", remoteId: 2);
  final OrganizerItemEntity organizerItemEntity3 =
      OrganizerItemEntity(id: 3, subject: "OrganizerItemEntity3", remoteId: 3);
  final OrganizerItemEntity organizerItemEntity4 =
      OrganizerItemEntity(id: 4, subject: "OrganizerItemEntity4", remoteId: 4);
  final OrganizerItemEntity organizerItemEntity5 =
      OrganizerItemEntity(id: 5, subject: "OrganizerItemEntity5", remoteId: 5);
  return OrganizerItems.of([
    organizerItemEntity1,
    organizerItemEntity2,
    organizerItemEntity3,
    organizerItemEntity4,
    organizerItemEntity5
  ]);
}

OrganizerItems<OrganizerItemEntity> getFiveOrganizerItemEntityUpdate() {
  final OrganizerItemEntity organizerItemEntity1 = OrganizerItemEntity(
      id: 1, subject: "OrganizerItemEntityUpdated1", remoteId: 1);
  final OrganizerItemEntity organizerItemEntity3 = OrganizerItemEntity(
      id: 3, subject: "OrganizerItemEntityUpdated3", remoteId: 3);
  final OrganizerItemEntity organizerItemEntity5 = OrganizerItemEntity(
      id: 5, subject: "OrganizerItemEntityUpdated5", remoteId: 5);
  final OrganizerItemEntity organizerItemEntity6 = OrganizerItemEntity(
      id: 6, subject: "OrganizerItemEntityUpdated6", remoteId: 6);
  final OrganizerItemEntity organizerItemEntity7 = OrganizerItemEntity(
      id: 7, subject: "OrganizerItemEntityUpdated7", remoteId: 7);
  return OrganizerItems.of([
    organizerItemEntity1,
    organizerItemEntity3,
    organizerItemEntity5,
    organizerItemEntity6,
    organizerItemEntity7
  ]);
}

OrganizerItems<OrganizerItemEntity> getFiveOrganizerItemEntityFiveUpdated() {
  final OrganizerItemEntity organizerItemEntity1 = OrganizerItemEntity(
      id: 1, subject: "OrganizerItemEntityUpdated1", remoteId: 1);
  final OrganizerItemEntity organizerItemEntity2 =
      OrganizerItemEntity(id: 2, subject: "OrganizerItemEntity2", remoteId: 2);
  final OrganizerItemEntity organizerItemEntity3 = OrganizerItemEntity(
      id: 3, subject: "OrganizerItemEntityUpdated3", remoteId: 3);
  final OrganizerItemEntity organizerItemEntity4 =
      OrganizerItemEntity(id: 4, subject: "OrganizerItemEntity4", remoteId: 4);
  final OrganizerItemEntity organizerItemEntity5 = OrganizerItemEntity(
      id: 5, subject: "OrganizerItemEntityUpdated5", remoteId: 5);
  final OrganizerItemEntity organizerItemEntity6 = OrganizerItemEntity(
      id: 6, subject: "OrganizerItemEntityUpdated6", remoteId: 6);
  final OrganizerItemEntity organizerItemEntity7 = OrganizerItemEntity(
      id: 7, subject: "OrganizerItemEntityUpdated7", remoteId: 7);
  return OrganizerItems.of([
    organizerItemEntity1,
    organizerItemEntity2,
    organizerItemEntity3,
    organizerItemEntity4,
    organizerItemEntity5,
    organizerItemEntity6,
    organizerItemEntity7
  ]);
}

OrganizerItems<TaskModel> getOrganizerItems5TaskModel() {
  final TaskModel taskModel1 =
      TaskModel(id: 1, subject: "TaskModel1", remoteId: 1);
  final TaskModel taskModel2 =
      TaskModel(id: 2, subject: "TaskModel2", remoteId: 2);
  final TaskModel taskModel3 =
      TaskModel(id: 3, subject: "TaskModel3", remoteId: 3);
  final TaskModel taskModel4 =
      TaskModel(id: 4, subject: "TaskModel4", remoteId: 4);
  final TaskModel taskModel5 =
      TaskModel(id: 5, subject: "TaskModel5", remoteId: 5);
  return OrganizerItems.of(
      [taskModel1, taskModel2, taskModel3, taskModel4, taskModel5]);
}

OrganizerItems<TaskModel> getOrganizerItems3TaskModelUpdate() {
  final TaskModel taskModel1 =
      TaskModel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
  final TaskModel taskModel3 =
      TaskModel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
  final TaskModel taskModel5 =
      TaskModel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
  return OrganizerItems.of([taskModel1, taskModel3, taskModel5]);
}

OrganizerItems<TaskModel> getOrganizerItems5TaskModelUpdate() {
  final TaskModel taskModel1 =
      TaskModel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
  final TaskModel taskModel3 =
      TaskModel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
  final TaskModel taskModel5 =
      TaskModel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
  final TaskModel taskModel6 =
      TaskModel(id: 0, subject: "TaskModelUpdated6", remoteId: 6);
  final TaskModel taskModel7 =
      TaskModel(id: 0, subject: "TaskModelUpdated7", remoteId: 7);
  return OrganizerItems.of(
      [taskModel1, taskModel3, taskModel5, taskModel6, taskModel7]);
}

OrganizerItems<TaskModel> getOrganizerItems5TaskModel3Updated() {
  final TaskModel taskModel1 =
      TaskModel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
  final TaskModel taskModel2 =
      TaskModel(id: 2, subject: "TaskModel2", remoteId: 2);
  final TaskModel taskModel3 =
      TaskModel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
  final TaskModel taskModel4 =
      TaskModel(id: 4, subject: "TaskModel4", remoteId: 4);
  final TaskModel taskModel5 =
      TaskModel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
  return OrganizerItems.of(
      [taskModel1, taskModel2, taskModel3, taskModel4, taskModel5]);
}

OrganizerItems<TaskModel> getOrganizerItems5TaskModel5Updated() {
  final TaskModel taskModel1 =
      TaskModel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
  final TaskModel taskModel2 =
      TaskModel(id: 2, subject: "TaskModel2", remoteId: 2);
  final TaskModel taskModel3 =
      TaskModel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
  final TaskModel taskModel4 =
      TaskModel(id: 4, subject: "TaskModel4", remoteId: 4);
  final TaskModel taskModel5 =
      TaskModel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
  final TaskModel taskModel6 =
      TaskModel(id: 6, subject: "TaskModel4", remoteId: 6);
  final TaskModel taskModel7 =
      TaskModel(id: 7, subject: "TaskModelUpdated5", remoteId: 7);
  return OrganizerItems.of([
    taskModel1,
    taskModel2,
    taskModel3,
    taskModel4,
    taskModel5,
    taskModel6,
    taskModel7
  ]);
}
