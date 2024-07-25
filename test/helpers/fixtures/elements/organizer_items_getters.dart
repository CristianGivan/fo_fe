import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

OrganizerItems<TaskEntity> getOrganizerItems3TaskEntity() {
  final TaskEntity taskEntity1 = TaskEntity(id: 1, subject: "Task1");
  final TaskEntity taskEntity2 = TaskEntity(id: 2, subject: "Task2");
  final TaskEntity taskEntity3 = TaskEntity(id: 3, subject: "Task3");

  return OrganizerItems.of([taskEntity1, taskEntity2, taskEntity3]);
}

OrganizerItems<OrganizerItemEntity> getFiveOrganizerItemEntity() {
  final OrganizerItemEntity organizerItemEntity1 =
      OrganizerItemEntity(id: 1, remoteId: 1);
  final OrganizerItemEntity organizerItemEntity2 =
      OrganizerItemEntity(id: 2, remoteId: 2);
  final OrganizerItemEntity organizerItemEntity3 =
      OrganizerItemEntity(id: 3, remoteId: 3);
  final OrganizerItemEntity organizerItemEntity4 =
      OrganizerItemEntity(id: 4, remoteId: 4);
  final OrganizerItemEntity organizerItemEntity5 =
      OrganizerItemEntity(id: 5, remoteId: 5);
  return OrganizerItems.of([
    organizerItemEntity1,
    organizerItemEntity2,
    organizerItemEntity3,
    organizerItemEntity4,
    organizerItemEntity5
  ]);
}

OrganizerItems<OrganizerItemEntity> getFiveOrganizerItemEntityUpdate() {
  final OrganizerItemEntity organizerItemEntity1 =
      OrganizerItemEntity(id: 1, remoteId: 1);
  final OrganizerItemEntity organizerItemEntity3 =
      OrganizerItemEntity(id: 3, remoteId: 3);
  final OrganizerItemEntity organizerItemEntity5 =
      OrganizerItemEntity(id: 5, remoteId: 5);
  final OrganizerItemEntity organizerItemEntity6 =
      OrganizerItemEntity(id: 6, remoteId: 6);
  final OrganizerItemEntity organizerItemEntity7 =
      OrganizerItemEntity(id: 7, remoteId: 7);
  return OrganizerItems.of([
    organizerItemEntity1,
    organizerItemEntity3,
    organizerItemEntity5,
    organizerItemEntity6,
    organizerItemEntity7
  ]);
}

OrganizerItems<OrganizerItemEntity> getFiveOrganizerItemEntityFiveUpdated() {
  final OrganizerItemEntity organizerItemEntity1 =
      OrganizerItemEntity(id: 1, remoteId: 1);
  final OrganizerItemEntity organizerItemEntity2 =
      OrganizerItemEntity(id: 2, remoteId: 2);
  final OrganizerItemEntity organizerItemEntity3 =
      OrganizerItemEntity(id: 3, remoteId: 3);
  final OrganizerItemEntity organizerItemEntity4 =
      OrganizerItemEntity(id: 4, remoteId: 4);
  final OrganizerItemEntity organizerItemEntity5 =
      OrganizerItemEntity(id: 5, remoteId: 5);
  final OrganizerItemEntity organizerItemEntity6 =
      OrganizerItemEntity(id: 6, remoteId: 6);
  final OrganizerItemEntity organizerItemEntity7 =
      OrganizerItemEntity(id: 7, remoteId: 7);
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
//
// OrganizerItems<TaskModelDel> getOrganizerItems5TaskModel() {
//   final TaskModelDel taskModel1 =
//       TaskModelDel(id: 1, subject: "TaskModel1", remoteId: 1);
//   final TaskModelDel taskModel2 =
//       TaskModelDel(id: 2, subject: "TaskModel2", remoteId: 2);
//   final TaskModelDel taskModel3 =
//       TaskModelDel(id: 3, subject: "TaskModel3", remoteId: 3);
//   final TaskModelDel taskModel4 =
//       TaskModelDel(id: 4, subject: "TaskModel4", remoteId: 4);
//   final TaskModelDel taskModel5 =
//       TaskModelDel(id: 5, subject: "TaskModel5", remoteId: 5);
//   return OrganizerItems.of(
//       [taskModel1, taskModel2, taskModel3, taskModel4, taskModel5]);
// }
//
// OrganizerItems<TaskModelDel> getOrganizerItems3TaskModelUpdate() {
//   final TaskModelDel taskModel1 =
//       TaskModelDel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
//   final TaskModelDel taskModel3 =
//       TaskModelDel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
//   final TaskModelDel taskModel5 =
//       TaskModelDel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
//   return OrganizerItems.of([taskModel1, taskModel3, taskModel5]);
// }
//
// OrganizerItems<TaskModelDel> getOrganizerItems5TaskModelUpdate() {
//   final TaskModelDel taskModel1 =
//       TaskModelDel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
//   final TaskModelDel taskModel3 =
//       TaskModelDel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
//   final TaskModelDel taskModel5 =
//       TaskModelDel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
//   final TaskModelDel taskModel6 =
//       TaskModelDel(id: 0, subject: "TaskModelUpdated6", remoteId: 6);
//   final TaskModelDel taskModel7 =
//       TaskModelDel(id: 0, subject: "TaskModelUpdated7", remoteId: 7);
//   return OrganizerItems.of(
//       [taskModel1, taskModel3, taskModel5, taskModel6, taskModel7]);
// }
//
// OrganizerItems<TaskModelDel> getOrganizerItems5TaskModel3Updated() {
//   final TaskModelDel taskModel1 =
//       TaskModelDel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
//   final TaskModelDel taskModel2 =
//       TaskModelDel(id: 2, subject: "TaskModel2", remoteId: 2);
//   final TaskModelDel taskModel3 =
//       TaskModelDel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
//   final TaskModelDel taskModel4 =
//       TaskModelDel(id: 4, subject: "TaskModel4", remoteId: 4);
//   final TaskModelDel taskModel5 =
//       TaskModelDel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
//   return OrganizerItems.of(
//       [taskModel1, taskModel2, taskModel3, taskModel4, taskModel5]);
// }
//
// OrganizerItems<TaskModelDel> getOrganizerItems5TaskModel5Updated() {
//   final TaskModelDel taskModel1 =
//       TaskModelDel(id: 1, subject: "TaskModelUpdated1", remoteId: 1);
//   final TaskModelDel taskModel2 =
//       TaskModelDel(id: 2, subject: "TaskModel2", remoteId: 2);
//   final TaskModelDel taskModel3 =
//       TaskModelDel(id: 3, subject: "TaskModelUpdated3", remoteId: 3);
//   final TaskModelDel taskModel4 =
//       TaskModelDel(id: 4, subject: "TaskModel4", remoteId: 4);
//   final TaskModelDel taskModel5 =
//       TaskModelDel(id: 5, subject: "TaskModelUpdated5", remoteId: 5);
//   final TaskModelDel taskModel6 =
//       TaskModelDel(id: 6, subject: "TaskModel4", remoteId: 6);
//   final TaskModelDel taskModel7 =
//       TaskModelDel(id: 7, subject: "TaskModelUpdated5", remoteId: 7);
//   return OrganizerItems.of([
//     taskModel1,
//     taskModel2,
//     taskModel3,
//     taskModel4,
//     taskModel5,
//     taskModel6,
//     taskModel7
//   ]);
// }
