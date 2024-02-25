part of '../../task_lib.dart';

class TaskModel extends TaskEntity {
  TaskModel(
    super.id,
    super.subject,
    super.status,
    super.createdDate,
    super.startDate,
    super.endDate,
    super.workingTime,
    super.estimatedTime,
    super.estimatedLeftTime,
    super.workingProgress,
    super.taskStatus,
    super.creator,
    super.userList,
    super.tagList,
    super.reminderList,
    super.workList,
    super.topicList,
    super.remoteTaskId,
    super.lastUpdate,
    super.lastViewDate,
    super.remoteViews,
    super.views,
    super.checksum,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      (json['taskId'] as num).toInt(),
      json['task'],
      json['taskStatus'] == 'COMPLETED',
      DateTime.parse(json['createdDate']),
      DateTime.parse(json['startDate']),
      DateTime.parse(json['endDate']),
      0,
      0,
      0,
      0,
      statusMap[json['taskStatus']] ?? TaskStatus.undefined, //todo to be
      User(0),
      const [],
      const [],
      const [],
      const [],
      const [],
      (json['remoteTaskId'] as num).toInt(),
      DateTime.parse(json['lastUpdate']),
      DateTime.parse(json['lastViewDate']),
      (json['remoteViews'] as num).toInt(),
      (json['views'] as num).toInt(),
      json['checksum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "taskId": id,
      "task": subject,
      "createdDate": createdDate.toIso8601String(),
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "taskStatus":
          taskStatus.toString().split('.').last.toUpperCase() ?? 'UNDEFINED',
      "remoteTaskId": remoteTaskId,
      "lastUpdate": lastUpdate.toIso8601String(),
      "lastViewDate": lastViewDate.toIso8601String(),
      "remoteViews": remoteViews,
      "views": views,
      "checksum": checksum,
    };
  }

    Map<String, dynamic> sendJsonToCheckIfIsUpdated() {
    return {
      "remoteTaskId": remoteTaskId,
      "checksum": checksum,
    };
  }

  static TaskModel empty() {
    return TaskModel(
      0,
      "",
      false,
      DateTime.now(),
      DateTime.now(),
      DateTime.now(),
      0,
      0,
      0,
      0,
      TaskStatus.undefined,
      User(0),
      const [],
      const [],
      const [],
      const [],
      const [],
      0,
      DateTime.now(),
      DateTime.now(),
      0,
      0,
      "",
    );
  }

  @override
  TaskModel copyWith({
    int? id,
    String? subject,
    bool? status,
    DateTime? createdDate,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    List<Work>? workList,
    List<Topic>? topicList,
    int? remoteTaskId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
  }) {
    return TaskModel(
      id ?? this.id,
      subject ?? this.subject,
      status ?? this.status,
      createdDate ?? this.createdDate,
      startDate ?? this.startDate,
      endDate ?? this.endDate,
      workingTime ?? this.workingTime,
      estimatedTime ?? this.estimatedTime,
      estimatedLeftTime ?? this.estimatedLeftTime,
      workingProgress ?? this.workingProgress,
      taskStatus ?? this.taskStatus,
      creator ?? this.creator,
      userList ?? this.userList,
      tagList ?? this.tagList,
      reminderList ?? this.reminderList,
      workList ?? this.workList,
      topicList ?? this.topicList,
      remoteTaskId ?? this.remoteTaskId,
      lastUpdate ?? this.lastUpdate,
      lastViewDate ?? this.lastViewDate,
      remoteViews ?? this.remoteViews,
      views ?? this.views,
      checksum ?? this.checksum,
    );
  }
}
