part of '../../task_lib.dart';

class TaskTest extends Equatable {
  int id;
  String subject;
  bool status; //todo tb del
  DateTime createdDate;
  DateTime startDate;
  DateTime endDate;
  double workingTime;
  double estimatedTime;
  double estimatedLeftTime;
  double workingProgress;
  TaskStatus taskStatus;
  List<User> userList;
  List<Tag> tagList;
  List<Reminder> reminderList;
  List<Work> workList;
  List<Topic> topicList;

  TaskTest(
    this.id,
    this.subject,
    this.status,
    this.createdDate,
    this.startDate,
    this.endDate,
    this.workingTime,
    this.estimatedTime,
    this.estimatedLeftTime,
    this.workingProgress,
    this.taskStatus,
    this.userList,
    this.tagList,
    this.reminderList,
    this.workList,
    this.topicList,
  );

  static TaskTest empty() {
    return TaskTest(
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
      [],
      [],
      [],
      [],
    );
  }

  @override
  String toString() {
    return 'TaskTest(id: $id, subject: $subject, status: $status, createdDate: $createdDate, startDate: $startDate, endDate: $endDate, workingTime: $workingTime, estimatedTime: $estimatedTime, estimatedLeftTime: $estimatedLeftTime, workingProgress: $workingProgress, taskStatus: $taskStatus, userList: $userList)';
  }

  @override
  List<Object> get props {
    return [
      id,
      subject,
      status,
      createdDate,
      startDate,
      endDate,
      workingTime,
      estimatedTime,
      estimatedLeftTime,
      workingProgress,
      taskStatus,
      userList,
      tagList,
      reminderList,
      workList,
      topicList,
    ];
  }

  TaskTest copyWith({
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
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    List<Work>? workList,
    List<Topic>? topicList,
  }) {
    return TaskTest(
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
      tagList ?? this.tagList,
      reminderList ?? this.reminderList,
      workList ?? this.workList,
      topicList ?? this.topicList,
    );
  }
}
