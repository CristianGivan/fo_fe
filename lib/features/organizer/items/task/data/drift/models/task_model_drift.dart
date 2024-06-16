import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_sqlite/drift_db.dart';

import '../../../../../util/organizer_enums.dart';

extension TaskModelDrift on TaskEntity {
  Future<TaskTableDriftCompanion> toCompanion() async {
    return TaskTableDriftCompanion(
      id: Value(id ?? 0),
      subject: Value(subject ?? ''),
      createdDate: Value(createdDate ?? DateTime(0)),
      // creatorId: Value(creator?.id ?? 0),
      // userList: Value(userList?.map((user) => user.id).toList() ?? []),
      // tagList: Value(tagList?.map((tag) => tag.name).toList() ?? []),
      // reminderList: Value(
      //     reminderList?.map((reminder) => reminder.toMap()).toList() ?? []),
      remoteId: Value(remoteId ?? 0),
      lastUpdate: Value(lastUpdate ?? DateTime(0)),
      lastViewDate: Value(lastViewDate ?? DateTime(0)),
      remoteViews: Value(remoteViews ?? 0),
      views: Value(views ?? 0),
      checksum: Value(checksum ?? ''),
      startDate: Value(startDate ?? DateTime(0)),
      endDate: Value(endDate ?? DateTime(0)),
      workingTime: Value(workingTime ?? 0),
      estimatedTime: Value(estimatedTime ?? 0),
      estimatedLeftTime: Value(estimatedLeftTime ?? 0),
      workingProgress: Value(workingProgress ?? 0),
      taskStatus:
          Value(taskStatus?.toString() ?? TaskStatus.undefined.toString()),
      // Include other fields as needed
    );
  }

  Future<TaskEntity> toEntity() async {
    return TaskEntity(
      id: id,
      subject: subject,
      createdDate: createdDate,
      // creator: creator,
      // userList: userList,
      // tagList: tagList,
      // reminderList: reminderList,
      remoteId: remoteId,
      lastUpdate: lastUpdate,
      lastViewDate: lastViewDate,
      remoteViews: remoteViews,
      views: views,
      checksum: checksum,
      startDate: startDate,
      endDate: endDate,
      workingTime: workingTime,
      estimatedTime: estimatedTime,
      estimatedLeftTime: estimatedLeftTime,
      workingProgress: workingProgress,
      taskStatus: taskStatus,
    );
  }
}
