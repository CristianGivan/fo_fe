part of '../../task_lib.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int? id,
    String? subject,
    DateTime? createdDate,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    int? remoteTaskId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
    List<Work>? workList,
    List<Topic>? topicList,
  }) : super(
          id: id ?? 0,
          subject: subject ?? '',
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          creator: creator ?? User(id: 0),
          userList: userList ?? [],
          tagList: tagList ?? [],
          reminderList: reminderList ?? [],
          remoteTaskId: remoteTaskId ?? 0,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastViewDate: lastViewDate ?? INITIAL_EPOCH_DATE,
          remoteViews: remoteViews ?? 0,
          views: views ?? 0,
          checksum: checksum ?? '',
          startDate: startDate ?? INITIAL_EPOCH_DATE,
          endDate: endDate ?? INITIAL_EPOCH_DATE,
          workingTime: workingTime ?? 0,
          estimatedTime: estimatedTime ?? 0,
          estimatedLeftTime: estimatedLeftTime ?? 0,
          workingProgress: workingProgress ?? 0,
          taskStatus: taskStatus ?? TaskStatus.undefined,
          workList: workList ?? [],
          topicList: topicList ?? [],
        );

  static TaskModel empty() {
    return TaskModel();
  }

// todo to be uodated
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      startDate:
          json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      workingTime: json['workingTime'],
      estimatedTime: json['estimatedTime'],
      estimatedLeftTime: json['estimatedLeftTime'],
      workingProgress: json['workingProgress'],
      taskStatus: statusMap[json['taskStatus']] ?? TaskStatus.undefined,
      workList: const [],
      //json['workList'] != null ? List<Work>.from(json['workList'].map((x) => Work.fromJson(x))) : null, // Assuming Work has a fromJson method
      topicList: const [],
      //json['topicList'] != null ? List<Topic>.from(json['topicList'].map((x) => Topic.fromJson(x))) : null, // Assuming Topic has a fromJson method
      id: json['id'],
      subject: json['subject'],
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : null,
      creator: const User(id: 0),
      //json['creator'] != null ? User.fromJson(json['creator']) : null, // Assuming User has a fromJson method
      userList: const [],
      //json['userList'] != null ? List<User>.from(json['userList'].map((x) => User.fromJson(x))) : null,
      tagList: const [],
      //json['tagList'] != null ? List<Tag>.from(json['tagList'].map((x) => Tag.fromJson(x))) : null,
      reminderList: const [],
      //json['reminderList'] != null ? List<Reminder>.from(json['reminderList'].map((x) => Reminder.fromJson(x))) : null,
      remoteTaskId: json['remoteId'],
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

  Map<String, dynamic> toJson() {
    return {
      "taskId": id,
      "task": subject,
      "createdDate": createdDate.toIso8601String(),
      "startDate": startDate?.toIso8601String(),
      "endDate": endDate?.toIso8601String(),
      "taskStatus":
          taskStatus.toString().split('.').last.toUpperCase() ?? 'UNDEFINED',
      "remoteTaskId": remoteTaskId,
      "lastUpdate": lastUpdate?.toIso8601String(),
      "lastViewDate": lastViewDate?.toIso8601String(),
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

  @override
  TaskModel copyWith({
    bool? status,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
    List<Work>? workList,
    List<Topic>? topicList,
    int? id,
    String? subject,
    DateTime? createdDate,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    int? remoteTaskId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
  }) {
    return TaskModel(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      workingTime: workingTime ?? this.workingTime,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      estimatedLeftTime: estimatedLeftTime ?? this.estimatedLeftTime,
      workingProgress: workingProgress ?? this.workingProgress,
      taskStatus: taskStatus ?? this.taskStatus,
      workList: workList ?? this.workList,
      topicList: topicList ?? this.topicList,
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      creator: creator ?? this.creator,
      userList: userList ?? this.userList,
      tagList: tagList ?? this.tagList,
      reminderList: reminderList ?? this.reminderList,
      remoteTaskId: remoteTaskId ?? this.remoteTaskId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewDate: lastViewDate ?? this.lastViewDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
    );
  }
}
