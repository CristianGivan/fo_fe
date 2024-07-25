// Mapper for converting TaskModel to TaskTableDrift and vice versa
import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

import '../../../../util/organizer_enums.dart';
import 'task_model.dart';

class TaskMapper {
  static TaskModel modelFromTableDrift(TaskTableDriftG task) {
    return TaskModel(
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

  static OrganizerItems<TaskModel> modelItemsFromTableDriftItems(
      List<TaskTableDriftG>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromTableDrift).toList());
  }

  static TaskTableDriftCompanion entityToCompanion(TaskEntity entity) {
    return TaskTableDriftCompanion(
      // id: Value(entity.id),
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
      taskStatus: Value(entity.taskStatus.toString()),
    );
  }

  static TaskTableDriftCompanion modelToCompanion(TaskModel model) {
    return TaskTableDriftCompanion(
      id: Value(model.id),
      subject: Value(model.subject),
      createdDate: Value(model.createdDate),
      creatorId: Value(model.creatorId),
      remoteId: model.remoteId != null
          ? Value(model.remoteId!)
          : const Value.absent(),
      lastUpdate: model.lastUpdate != null
          ? Value(model.lastUpdate!)
          : const Value.absent(),
      lastAccessedDate: model.lastAccessedDate != null
          ? Value(model.lastAccessedDate!)
          : const Value.absent(),
      remoteAccesses: model.remoteAccesses != null
          ? Value(model.remoteAccesses!)
          : const Value.absent(),
      accesses: model.accesses != null
          ? Value(model.accesses!)
          : const Value.absent(),
      checksum: model.checksum != null
          ? Value(model.checksum!)
          : const Value.absent(),
      startDate: model.startDate != null
          ? Value(model.startDate!)
          : const Value.absent(),
      endDate:
          model.endDate != null ? Value(model.endDate!) : const Value.absent(),
      workingTime: model.workingTime != null
          ? Value(model.workingTime!)
          : const Value.absent(),
      estimatedTime: model.estimatedTime != null
          ? Value(model.estimatedTime!)
          : const Value.absent(),
      estimatedLeftTime: model.estimatedLeftTime != null
          ? Value(model.estimatedLeftTime!)
          : const Value.absent(),
      workingProgress: model.workingProgress != null
          ? Value(model.workingProgress!)
          : const Value.absent(),
      taskStatus: model.taskStatus != null
          ? Value(model.taskStatus as String?)
          : const Value.absent(),
    );
  }

  static TaskEntity modelToEntity(TaskModel model) {
    return TaskEntity(
      id: model.id,
      subject: model.subject,
      createdDate: model.createdDate,
      creatorId: model.creatorId,
      remoteId: model.remoteId,
      lastUpdate: model.lastUpdate,
      lastViewDate: model.lastAccessedDate,
      remoteViews: model.remoteAccesses,
      views: model.accesses,
      checksum: model.checksum,
      startDate: model.startDate,
      endDate: model.endDate,
      workingTime: model.workingTime,
      estimatedTime: model.estimatedTime,
      estimatedLeftTime: model.estimatedLeftTime,
      workingProgress: model.workingProgress,
      taskStatus: model.taskStatus,
    );
  }

  static TaskModelLazyLoaded entityLazyLoadedToModelLazyLoaded(
      TaskEntityLazyLoaded entity) {
    return TaskModelLazyLoaded(
      id: entity.id,
      subject: entity.subject,
      createdDate: entity.createdDate,
      creatorId: entity.creatorId,
      remoteId: entity.remoteId,
      lastUpdate: entity.lastUpdate,
      lastViewDate: entity.lastAccessedDate,
      remoteViews: entity.remoteAccesses,
      views: entity.accesses,
      checksum: entity.checksum,
      startDate: entity.startDate,
      endDate: entity.endDate,
      workingTime: entity.workingTime,
      estimatedTime: entity.estimatedTime,
      estimatedLeftTime: entity.estimatedLeftTime,
      workingProgress: entity.workingProgress,
      taskStatus: entity.taskStatus,
      creator: UserMapper.modelFromEntity(entity.creator),
      //todo cg to be check nullable topic
      userItems: UserMapper.modelItemsFromEntityItems(entity.userItems),
      //todo cg to be check nullable topic
      tagItems: TagMapper.modelItemsFromEntityItems(entity.tagItems),
      reminderItems: ReminderMapper.entityListToModelList(entity.reminderItems),
    );
  }

  static TaskEntityLazyLoaded modelLazyLoadedToEntityLazyLoaded(
      TaskModelLazyLoaded model) {
    return TaskEntityLazyLoaded(
      id: model.id,
      subject: model.subject,
      createdDate: model.createdDate,
      creatorId: model.creatorId,
      remoteId: model.remoteId,
      lastUpdate: model.lastUpdate,
      lastViewDate: model.lastAccessedDate,
      remoteViews: model.remoteAccesses,
      views: model.accesses,
      checksum: model.checksum,
      startDate: model.startDate,
      endDate: model.endDate,
      workingTime: model.workingTime,
      estimatedTime: model.estimatedTime,
      estimatedLeftTime: model.estimatedLeftTime,
      workingProgress: model.workingProgress,
      taskStatus: model.taskStatus,
      creator: model.creator != null
          ? UserMapper.entityFromModel(model.creator!)
          : null,
      userItems: UserMapper.entityItemsFromModelItems(model.userItems),
      tagItems: TagMapper.entityItemsFromModelItems(model.tagItems),
      reminderItems:
          ReminderMapper.entityItemsFromModelItems(model.reminderItems),
    );
  }

  static TaskModelLazyLoaded toLazyLoadedModel(
      TaskTableDriftG task,
      UserModel? creator,
      OrganizerItems<UserModel> userItems,
      OrganizerItems<TagModel> tagItems,
      OrganizerItems<ReminderModel> reminderItems) {
    return TaskModelLazyLoaded(
      id: task.id,
      subject: task.subject,
      createdDate: task.createdDate,
      creatorId: task.creatorId,
      remoteId: task.remoteId,
      lastUpdate: task.lastUpdate,
      lastViewDate: task.lastAccessedDate,
      remoteViews: task.remoteAccesses,
      views: task.accesses,
      checksum: task.checksum,
      startDate: task.startDate,
      endDate: task.endDate,
      workingTime: task.workingTime,
      estimatedTime: task.estimatedTime,
      estimatedLeftTime: task.estimatedLeftTime,
      workingProgress: task.workingProgress,
      taskStatus: taskStatusMap[task.taskStatus],
      creator: creator,
      userItems: userItems,
      tagItems: tagItems,
      reminderItems: reminderItems,
    );
  }

  static TaskModel entityToModel(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      subject: entity.subject,
      createdDate: entity.createdDate,
      creatorId: entity.creatorId,
      remoteId: entity.remoteId,
      lastUpdate: entity.lastUpdate,
      lastAccessedDate: entity.lastAccessedDate,
      remoteAccesses: entity.remoteAccesses,
      accesses: entity.accesses,
      checksum: entity.checksum,
      startDate: entity.startDate,
      endDate: entity.endDate,
      workingTime: entity.workingTime,
      estimatedTime: entity.estimatedTime,
      estimatedLeftTime: entity.estimatedLeftTime,
      workingProgress: entity.workingProgress,
      taskStatus: entity.taskStatus,
    );
  }

  static jsonFoApiToModel(Map<String, dynamic> json) {
    return TaskModel(
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
  Map<String, dynamic> modelToJson(TaskModel model) {
    return {
      "taskId": model.id,
      "task": model.subject,
      "createdDate": model.createdDate.toIso8601String(),
      "startDate": model.startDate?.toIso8601String(),
      "endDate": model.endDate?.toIso8601String(),
      "taskStatus": model.taskStatus.toString().split('.').last.toUpperCase() ??
          'UNDEFINED',
      "remoteId": model.remoteId,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
      "lastViewDate": model.lastAccessedDate?.toIso8601String(),
      "remoteViews": model.remoteAccesses,
      "views": model.accesses,
      "checksum": model.checksum,
    };
  }

  static Map<String, dynamic> modelToJsonForCheckingTheUpdates(
      TaskModel model) {
    return {
      "remoteId": model.remoteId,
      "checksum": model.checksum,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
    };
  }
}
