part of '../../task_lib.dart';

class TaskEntity extends OrganizerItemEntity with EquatableMixin {
  final bool? status; //todo tb del
  final DateTime? startDate;
  final DateTime? endDate;
  final double? workingTime;
  final double? estimatedTime;
  final double? estimatedLeftTime;
  final double? workingProgress;
  final TaskStatus? taskStatus;
  final List<Work>? workList;
  final List<Topic>? topicList;

  TaskEntity({
    this.status,
    this.startDate,
    this.endDate,
    this.workingTime,
    this.estimatedTime,
    this.estimatedLeftTime,
    this.workingProgress,
    this.taskStatus,
    this.workList,
    this.topicList,
    super.id,
    super.subject,
    super.createdDate,
    super.creator,
    super.userList,
    super.tagList,
    super.reminderList,
    super.remoteTaskId,
    super.lastUpdate,
    super.lastViewDate,
    super.remoteViews,
    super.views,
    super.checksum,
  });

  bool changeState() {
    // if(status==null){
    //   status=false;
    // }
    // status = !status!;
    return true; //todo status delete it;
  }

  @override
  String toString() {
    return 'TaskEntity{id: $id, subject: $subject, status: $status, createdDate: $createdDate, startDate: $startDate, endDate: $endDate, workingTime: $workingTime, estimatedTime: $estimatedTime, estimatedLeftTime: $estimatedLeftTime, workingProgress: $workingProgress, taskStatus: $taskStatus, creator: $creator, userList: $userList, tagList: $tagList, reminderList: $reminderList, workList: $workList, topicList: $topicList, remoteId: $remoteTaskId, lastUpdate: $lastUpdate, lastViewDate: $lastViewDate, remoteViews: $remoteViews, views: $views, checksum: $checksum}';
  }

  @override
  List<Object?> get props => [
        ...super.props,
        status,
        startDate,
        endDate,
        workingTime,
        estimatedTime,
        estimatedLeftTime,
        workingProgress,
        taskStatus,
        workList,
        topicList,
      ];

  TaskEntity copyWith({
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
  }) {
    return TaskEntity(
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      workingTime: workingTime ?? this.workingTime,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      estimatedLeftTime: estimatedLeftTime ?? this.estimatedLeftTime,
      workingProgress: workingProgress ?? this.workingProgress,
      taskStatus: taskStatus ?? this.taskStatus,
      workList: workList ?? this.workList,
      topicList: topicList ?? this.topicList,
      id: id,
      subject: subject,
      createdDate: createdDate,
      creator: creator,
      userList: userList,
      tagList: tagList,
      reminderList: reminderList,
      remoteTaskId: remoteTaskId,
      lastUpdate: lastUpdate,
      lastViewDate: lastViewDate,
      remoteViews: remoteViews,
      views: views,
      checksum: checksum,
    );
  }

  static TaskEntity empty() {
    return TaskEntity(
      status: false,
      startDate: DateTime.utc(1970, 1, 1),
      endDate: DateTime.utc(1970, 1, 1),
      workingTime: 0,
      estimatedTime: 0,
      estimatedLeftTime: 0,
      workingProgress: 0,
      taskStatus: TaskStatus.undefined,
      workList: [],
      topicList: [],
      id: 0,
      subject: "",
      createdDate: DateTime.utc(1970, 1, 1),
      creator: User(0),
      userList: [],
      tagList: [],
      reminderList: [],
      remoteTaskId: 0,
      lastUpdate: DateTime.utc(1970, 1, 1),
      lastViewDate: DateTime.utc(1970, 1, 1),
      remoteViews: 0,
      views: 0,
      checksum: "",
    );
  }
}
