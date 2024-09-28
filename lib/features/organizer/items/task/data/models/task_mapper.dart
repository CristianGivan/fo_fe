// Mapper for converting TaskModel to TaskTableDrift and vice versa
import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TaskMapper {
  static TaskEntity entityFromTableDrift(TaskTableDriftG task) {
    return TaskEntity(
      id: task.id,
      subject: task.subject,
      createdDate: task.createdDate,
      creatorId: task.creatorId,
      remoteId: task.remoteId,
      lastUpdate: task.lastUpdate,
      lastAccessedDate: task.lastAccessedDate,
      remoteAccesses: task.remoteAccesses,
      accesses: task.accesses,
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

  static OrganizerItems<TaskEntity> entityItemsFromTableDriftItems(
      List<TaskTableDriftG> items) {
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
      lastAccessedDate: Value(entity.lastAccessedDate),
      remoteAccesses: Value(entity.remoteAccesses),
      accesses: Value(entity.accesses),
      checksum: Value(entity.checksum),
      startDate: Value(entity.startDate),
      endDate: Value(entity.endDate),
      workingTime: Value(entity.workingTime),
      estimatedTime: Value(entity.estimatedTime),
      estimatedLeftTime: Value(entity.estimatedLeftTime),
      workingProgress: Value(entity.workingProgress),
      taskStatus: Value(taskStatusToStringMap[entity.taskStatus]),
    );
  }

  static jsonFoApiToModel(Map<String, dynamic> json) {
    return TaskEntity(
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
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
      lastUpdate: json['lastUpdate'] != null
          ? DateTime.parse(json['lastUpdate'])
          : null,
      lastAccessedDate: json['lastViewDate'] != null
          ? DateTime.parse(json['lastViewDate'])
          : null,
      remoteAccesses: json['remoteViews'],
      accesses: json['views'],
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
      "taskStatus": taskStatusToStringMap[model.taskStatus] ?? 'UNDEFINED',
      "remoteId": model.remoteId,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
      "lastViewDate": model.lastAccessedDate?.toIso8601String(),
      "remoteViews": model.remoteAccesses,
      "views": model.accesses,
      "checksum": model.checksum,
    };
  }

  static Map<String, dynamic> jsonForCheckingTheUpdatesFromEntity(
      TaskEntity model) {
    return {
      "remoteId": model.remoteId,
      "checksum": model.checksum,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
    };
  }
}
