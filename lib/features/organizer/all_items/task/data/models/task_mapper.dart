// Mapper for converting TaskModel to TaskTableDrift and vice versa

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/models/task_user_link_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/organizer_items.dart';

class TaskMapper {
  static TaskEntity entityFromTableDrift(TaskTableDriftG task) {
    return TaskEntity(
      id: task.id,
      subject: task.subject,
      createdDate: task.createdDate,
      creatorId: task.creatorId,
      remoteId: task.remoteId,
      lastUpdate: task.lastUpdate,
      lastViewedDate: task.lastViewedDate,
      remoteViews: task.remoteViews,
      views: task.views,
      checksum: task.checksum,
      startDate: task.startDate,
      endDate: task.endDate,
      workingTime: task.workingTime,
      estimatedTime: task.estimatedTime,
      estimatedLeftTime: task.estimatedLeftTime,
      workingProgress: task.workingProgress,
      taskStatus: taskStatusMap[task.taskStatus],
    );
  }

  static OrganizerItems<TaskEntity> entityItemsFromTableDriftItems(List<TaskTableDriftG> items) {
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static TaskTableDriftCompanion entityToCompanion(TaskEntity entity) {
    return TaskTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      subject: Value(entity.subject),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      remoteId: Value(entity.remoteId),
      lastUpdate: Value(entity.lastUpdate),
      lastViewedDate: Value(entity.lastViewedDate),
      remoteViews: Value(entity.remoteViews),
      views: Value(entity.views),
      checksum: Value(entity.checksum),
      startDate: Value(entity.startDate),
      endDate: Value(entity.endDate),
      workingTime: Value(entity.workingTime),
      estimatedTime: Value(entity.estimatedTime),
      estimatedLeftTime: Value(entity.estimatedLeftTime),
      workingProgress: Value(entity.workingProgress),
      taskStatus: Value(taskStatusMapToString[entity.taskStatus]),
    );
  }

  static jsonFoApiToModel(Map<String, dynamic> json) {
    return TaskEntity(
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      workingTime: json['workingTime'],
      estimatedTime: json['estimatedTime'],
      estimatedLeftTime: json['estimatedLeftTime'],
      workingProgress: json['workingProgress'],
      taskStatus: taskStatusMap[json['taskStatus']] ?? TaskStatus.undefined,
      id: json['id'],
      subject: json['subject'],
      createdDate: json['createdDate'],
      creatorId: json['creatorId'],
      //todo cg
      //json['creator'] != null ? User.fromJson(json['creator']) : null, // Assuming User has a fromJson method
      // userList: const [],
      //json['userList'] != null ? List<User>.from(json['userList'].map((x) => User.fromJson(x))) : null,
      // tagList: const [],
      //json['tagList'] != null ? List<Tag>.from(json['tagList'].map((x) => Tag.fromJson(x))) : null,
      // reminderList: const [],
      //json['reminderList'] != null ? List<Reminder>.from(json['reminderList'].map((x) => Reminder.fromJson(x))) : null,
      remoteId: json['remoteId'],
      lastUpdate: json['lastUpdate'] != null ? DateTime.parse(json['lastUpdate']) : null,
      lastViewedDate: json['lastViewDate'] != null ? DateTime.parse(json['lastViewDate']) : null,
      remoteViews: json['remoteViews'],
      views: json['views'],
      checksum: json['checksum'],
    );
  }

  //todo overwrite
  Map<String, dynamic> jsonFromEntity(TaskEntity model) {
    return {
      "taskId": model.id,
      "task": model.subject,
      "createdDate": model.createdDate.toIso8601String(),
      "startDate": model.startDate?.toIso8601String(),
      "endDate": model.endDate?.toIso8601String(),
      "taskStatus": taskStatusMapToString[model.taskStatus] ?? 'UNDEFINED',
      "remoteId": model.remoteId,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
      "lastViewDate": model.lastViewedDate?.toIso8601String(),
      "remoteViews": model.remoteViews,
      "views": model.views,
      "checksum": model.checksum,
    };
  }

  static Map<String, dynamic> jsonForCheckingTheUpdatesFromEntity(TaskEntity model) {
    return {
      "remoteId": model.remoteId,
      "checksum": model.checksum,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
    };
  }

  //todo -refactor- check if is possible
  //      final taskRow = row.readTable(db.taskTableDrift);
  //         task: TaskEntity(
  //           id: taskRow.id,
  //           remoteId: taskRow.remoteId,
  //           ...

  //todo -refactor- a better way to do this
  static OrganizerItems<TaskDto> itemsFromRows(List<QueryRow> rows) {
    List<TaskDto> items = rows
        .map((row) => TaskDto(
              task: taskEntityFromRow(row),
              taskUserLink: TaskUserLinkMapper.rowToTaskUserEntity(row),
            ))
        .toList();
    return OrganizerItems.of(items);
  }

  static OrganizerItems<TaskEntity> entitiesFromRows(List<QueryRow> rows) {
    List<TaskEntity> items = rows.map((row) => taskEntityFromRow(row)).toList();
    return OrganizerItems.of(items);
  }

  static TaskEntity taskEntityFromRow(QueryRow row) {
    return TaskEntity(
      id: row.read<int>('id'),
      subject: row.read<String>('subject'),
      startDate: row.read<DateTime>('start_date'),
      endDate: row.read<DateTime>('end_date'),
      workingTime: row.read<double>('working_time'),
      estimatedTime: row.read<double>('estimated_time'),
      estimatedLeftTime: row.read<double>('estimated_left_time'),
      workingProgress: row.read<double>('working_progress'),
      taskStatus: taskStatusMap[row.read<String>('task_status')],
      createdDate: row.read<DateTime>('created_date'),
      creatorId: row.read<int>('creator_id'),
      remoteId: row.read<int>('remote_id'),
      lastUpdate: row.read<DateTime>('last_update'),
      lastViewedDate: row.read<DateTime>('last_viewed_date'),
      remoteViews: row.read<int>('remote_views'),
      views: row.read<int>('views'),
      checksum: row.read<String>('checksum'),
    );
  }
//
// List<TaskDto> dtoItemsFromQueryResult(List<TypedResult> items) {
//   return items.map((row) {
//     final taskRow = row.readTable(db.taskTableDrift);
//     final taskUserLinkRow = row.readTableOrNull(db.taskUserLinkTableDrift);
//
//     return TaskDto(
//       task: TaskEntity(
//         id: taskRow.id,
//         remoteId: taskRow.remoteId,
//         subject: taskRow.subject,
//         startDate: taskRow.startDate,
//         endDate: taskRow.endDate,
//         workingTime: taskRow.workingTime,
//         estimatedTime: taskRow.estimatedTime,
//         estimatedLeftTime: taskRow.estimatedLeftTime,
//         workingProgress: taskRow.workingProgress,
//         taskStatus: taskStatusMap[taskRow.taskStatus],
//       ),
//       taskUserLink: TaskUserLinkEntity(
//         id: taskUserLinkRow?.id ?? 0,
//         linkingDate: taskUserLinkRow?.linkingDate ?? DateTime.now(),
//         taskId: taskUserLinkRow?.taskId ?? 0,
//         userId: taskUserLinkRow?.userId ?? 0,
//         selectedByUser: taskUserLinkRow?.selectedByUser ?? false,
//         orderedByUser: taskUserLinkRow?.orderedByUser ?? double.maxFinite.toInt(),
//       ),
//     );
//   }).toList();
// }
}
