part of '../../task_lib.dart';

class TaskEntity extends Equatable {
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
  User creator;
  List<User> userList;
  List<Tag> tagList;
  List<Reminder> reminderList;
  List<Work> workList;
  List<Topic> topicList;

  TaskEntity(
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
    this.creator,
    this.userList,
    this.tagList,
    this.reminderList,
    this.workList,
    this.topicList,
  );

  // todo tb del
  bool changeState() {
    status = !status;
    return status;
  }

  static TaskEntity empty() {
    return TaskEntity(
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
      [],
      [],
      [],
      [],
      [],
    );
  }

  TaskEntity copyWith({
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
  }) {
    return TaskEntity(
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
    );
  }

  @override
  String toString() {
    return 'TaskEntity(id: $id, subject: $subject, status: $status, createdDate: $createdDate, startDate: $startDate, endDate: $endDate, workingTime: $workingTime, estimatedTime: $estimatedTime, estimatedLeftTime: $estimatedLeftTime, workingProgress: $workingProgress, taskStatus: $taskStatus, creator: $creator, userList: $userList, tagList: $tagList, reminderList: $reminderList, workList: $workList, topicList: $topicList)';
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
      creator,
      userList,
      tagList,
      reminderList,
      workList,
      topicList,
    ];
  }
}
