part of '../../task_lib.dart';

class TaskTestModel extends TaskTest {
  TaskTestModel(
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
      super.userList,

  );

  static TaskTestModel empty() {
    return TaskTestModel(
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
      [],

    );
  }
  TaskTestModel copyWith({
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
    List<User>? userList,
  }) {
    return TaskTestModel(
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
      userList ?? this.userList,
    );
  }

  factory TaskTestModel.fromJson(Map<String, dynamic> json) {
    return TaskTestModel(
      json['taskId'],
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
      [],
    );
  }

}
