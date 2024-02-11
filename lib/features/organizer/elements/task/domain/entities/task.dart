// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  User creator;
  List<User> userList;
  List<Tag> tagList;
  List<Reminder> reminderList;
  List<Work> workList;
  List<Topic> topicList;
  TaskStatus taskStatus;

  // todo tb del
  bool changeState() {
    status = !status;
    return status;
  }

  TaskEntity(
    this.id,
    this.subject,
    this.status, // todo tb del
    this.createdDate,
    this.startDate,
    this.endDate,
    this.workingTime,
    this.estimatedTime,
    this.estimatedLeftTime,
    this.workingProgress,
    this.creator,
    this.userList,
    this.tagList,
    this.reminderList,
    this.workList,
    this.topicList,
    this.taskStatus,
  );

  @override
  String toString() {
    return 'Task{id: $id, subject: $subject, createdDate: $createdDate, startDate: $startDate, endDate: $endDate, workingTime: $workingTime, estimatedTime: $estimatedTime, estimatedLeftTime: $estimatedLeftTime, workingProgress: $workingProgress, status: $status, taskStatus: $taskStatus, creator: $creator, userList: $userList, tagList: $tagList, reminderList: $reminderList, workList: $workList, topicList: $topicList}';
  }

  @override
  List<Object> get props {
    return [
      id,
      subject,
      createdDate,
      startDate,
      endDate,
      workingTime,
      estimatedTime,
      estimatedLeftTime,
      workingProgress,
      creator,
      userList,
      tagList,
      reminderList,
      workList,
      topicList,
      status,
    ];
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
        User(0),
        [],
        [],
        [],
        [],
        [],
        TaskStatus.start);
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
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    List<Work>? workList,
    List<Topic>? topicList,
    TaskStatus? taskStatus,
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
      creator ?? this.creator,
      userList ?? this.userList,
      tagList ?? this.tagList,
      reminderList ?? this.reminderList,
      workList ?? this.workList,
      topicList ?? this.topicList,
      taskStatus ?? this.taskStatus,
    );
  }
}
