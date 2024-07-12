// Mapper for converting TaskModel to TaskTableDrift and vice versa
import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

import '../../../../util/organizer_enums.dart';
import 'task_model.dart';

class TaskMapper {
  static TaskModel fromTableDrift(TaskTableDriftG task) {
    return TaskModel(
      id: task.id,
      subject: task.subject,
      createdDate: task.createdDate,
      creatorId: task.creatorId,
      remoteId: task.remoteId,
      lastUpdate: task.lastUpdate,
      lastViewDate: task.lastViewDate,
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

  static TaskTableDriftCompanion entityToCompanion(TaskEntity entity) {
    return TaskTableDriftCompanion(
      // id: Value(entity.id),
      subject: Value(entity.subject),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      remoteId: Value(entity.remoteId),
      lastUpdate: Value(entity.lastUpdate),
      lastViewDate: Value(entity.lastViewDate),
      remoteViews: Value(entity.remoteViews),
      views: Value(entity.views),
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
      lastViewDate: model.lastViewDate != null
          ? Value(model.lastViewDate!)
          : const Value.absent(),
      remoteViews: model.remoteViews != null
          ? Value(model.remoteViews!)
          : const Value.absent(),
      views: model.views != null ? Value(model.views!) : const Value.absent(),
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
      lastViewDate: model.lastViewDate,
      remoteViews: model.remoteViews,
      views: model.views,
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
      lastViewDate: entity.lastViewDate,
      remoteViews: entity.remoteViews,
      views: entity.views,
      checksum: entity.checksum,
      startDate: entity.startDate,
      endDate: entity.endDate,
      workingTime: entity.workingTime,
      estimatedTime: entity.estimatedTime,
      estimatedLeftTime: entity.estimatedLeftTime,
      workingProgress: entity.workingProgress,
      taskStatus: entity.taskStatus,
      creator: UserMapper.entityToModel(entity.creator),
      //todo cg to be check nullable topic
      userList: UserMapper.entityListToModelList(entity.userList),
      //todo cg to be check nullable topic
      tagList: TagMapper.entityListToModelList(entity.tagList),
      reminderList: ReminderMapper.entityListToModelList(entity.reminderList),
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
      lastViewDate: model.lastViewDate,
      remoteViews: model.remoteViews,
      views: model.views,
      checksum: model.checksum,
      startDate: model.startDate,
      endDate: model.endDate,
      workingTime: model.workingTime,
      estimatedTime: model.estimatedTime,
      estimatedLeftTime: model.estimatedLeftTime,
      workingProgress: model.workingProgress,
      taskStatus: model.taskStatus,
      creator: model.creator != null
          ? UserMapper.modelToEntity(model.creator!)
          : null,
      userList: UserMapper.modelListToEntityList(model.userList),
      tagList: TagMapper.modelListToEntityList(model.tagList),
      reminderList: ReminderMapper.modelListToEntityList(model.reminderList),
    );
  }

  static TaskModelLazyLoaded toLazyLoadedModel(
      TaskTableDriftG task,
      UserModel? creator,
      List<UserModel> userList,
      List<TagModel> tagList,
      List<ReminderModel> reminderList) {
    return TaskModelLazyLoaded(
      id: task.id,
      subject: task.subject,
      createdDate: task.createdDate,
      creatorId: task.creatorId,
      remoteId: task.remoteId,
      lastUpdate: task.lastUpdate,
      lastViewDate: task.lastViewDate,
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
      creator: creator,
      userList: userList,
      tagList: tagList,
      reminderList: reminderList,
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
      lastViewDate: entity.lastViewDate,
      remoteViews: entity.remoteViews,
      views: entity.views,
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
      lastViewDate: json['lastViewDate'] != null
          ? DateTime.parse(json['lastViewDate'])
          : null,
      remoteViews: json['remoteViews'],
      views: json['views'],
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
      "lastViewDate": model.lastViewDate?.toIso8601String(),
      "remoteViews": model.remoteViews,
      "views": model.views,
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
