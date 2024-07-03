// Mapper for converting TaskModel to TaskTableDrift and vice versa
import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

import '../../../../util/organizer_enums.dart';
import 'task_model.dart';

class TaskMapper {
  // Convert TaskModel to TaskTableDriftCompanion
  static TaskTableDriftCompanion toTaskTableDriftCompanion(TaskModel model) {
    return TaskTableDriftCompanion(
      id: Value(model.id),
      subject: Value(model.subject),
      createdDate: Value(model.createdDate),
      creatorId: Value(model.creatorId),
      remoteId: Value(model.remoteId),
      lastUpdate: Value(model.lastUpdate),
      lastViewDate: Value(model.lastViewDate),
      remoteViews: Value(model.remoteViews),
      views: Value(model.views),
      checksum: Value(model.checksum),
      startDate: Value(model.startDate),
      endDate: Value(model.endDate),
      workingTime: Value(model.workingTime),
      estimatedTime: Value(model.estimatedTime),
      estimatedLeftTime: Value(model.estimatedLeftTime),
      workingProgress: Value(model.workingProgress),
      taskStatus:
          Value(model.taskStatus?.toString()), // Assuming TaskStatus is an enum
    );
  }

  // Convert TaskTableDrift to TaskModel
  static TaskModel fromTaskTableDrift(TaskTableDriftG table) {
    return TaskModel(
        id: table.id,
        subject: table.subject,
        createdDate: table.createdDate,
        creatorId: table.creatorId,
        remoteId: table.remoteId,
        lastUpdate: table.lastUpdate,
        lastViewDate: table.lastViewDate,
        remoteViews: table.remoteViews,
        views: table.views,
        checksum: table.checksum,
        startDate: table.startDate,
        endDate: table.endDate,
        workingTime: table.workingTime,
        estimatedTime: table.estimatedTime,
        estimatedLeftTime: table.estimatedLeftTime,
        workingProgress: table.workingProgress,
        taskStatus:
            statusMap[table.taskStatus] // Assuming TaskStatus is an enum
        );
  }
}
