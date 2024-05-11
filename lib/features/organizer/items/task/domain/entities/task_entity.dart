part of '../../task_lib.dart';

class TaskEntity extends OrganizerItemEntity with EquatableMixin {
  final DateTime? _startDate;
  final DateTime? _endDate;
  final double? _workingTime;
  final double? _estimatedTime;
  final double? _estimatedLeftTime;
  final double? _workingProgress;
  final TaskStatus? _taskStatus;
  final List<Work>? _workList;
  final List<Topic>? _topicList;

  TaskEntity({
    int? id,
    String? subject,
    DateTime? createdDate,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    int? remoteId,
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
  })  : _startDate = startDate ?? INITIAL_EPOCH_DATE,
        _endDate = endDate ?? INITIAL_EPOCH_DATE,
        _workingTime = workingTime ?? 0,
        _estimatedTime = estimatedTime ?? 0,
        _estimatedLeftTime = estimatedLeftTime ?? 0,
        _workingProgress = workingProgress ?? 0,
        _taskStatus = taskStatus ?? TaskStatus.undefined,
        _workList = workList ?? [],
        _topicList = topicList ?? [],
        super(
          id: id ?? 0,
          subject: subject ?? '',
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          creator: creator ?? const User(id: 0),
          userList: userList ?? [],
          tagList: tagList ?? [],
          reminderList: reminderList ?? [],
          remoteId: remoteId ?? 0,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastViewDate: lastViewDate ?? INITIAL_EPOCH_DATE,
          remoteViews: remoteViews ?? 0,
          views: views ?? 0,
          checksum: checksum ?? '',
        );

  factory TaskEntity.empty() {
    return TaskEntity();
  }

  @override
  List<Object?> get props => [
        ...super.props,
        _startDate,
        _endDate,
        _workingTime,
        _estimatedTime,
        _estimatedLeftTime,
        _workingProgress,
        _taskStatus,
        _workList,
        _topicList,
      ];

  // Getters for all fields

  DateTime? get startDate => _startDate;

  DateTime? get endDate => _endDate;

  double? get workingTime => _workingTime;

  double? get estimatedTime => _estimatedTime;

  double? get estimatedLeftTime => _estimatedLeftTime;

  double? get workingProgress => _workingProgress;

  TaskStatus? get taskStatus => _taskStatus;

  List<Work>? get workList => _workList; // Defensive copy
  List<Topic>? get topicList => _topicList; // Defensive copy

  @override
  TaskEntity copyWith({
    int? id,
    String? subject,
    DateTime? createdDate,
    User? creator,
    List<User>? userList,
    List<Tag>? tagList,
    List<Reminder>? reminderList,
    int? remoteId,
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
  }) {
    return TaskEntity(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      creator: creator ?? this.creator,
      userList: userList ?? this.userList,
      tagList: tagList ?? this.tagList,
      reminderList: reminderList ?? this.reminderList,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewDate: lastViewDate ?? this.lastViewDate,
      remoteViews: remoteViews ?? this.remoteViews,
      views: views ?? this.views,
      checksum: checksum ?? this.checksum,
      startDate: startDate ?? _startDate,
      endDate: endDate ?? _endDate,
      workingTime: workingTime ?? _workingTime,
      estimatedTime: estimatedTime ?? _estimatedTime,
      estimatedLeftTime: estimatedLeftTime ?? _estimatedLeftTime,
      workingProgress: workingProgress ?? _workingProgress,
      taskStatus: taskStatus ?? _taskStatus,
      workList: workList ?? _workList,
      topicList: topicList ?? _topicList,
    );
  }

// todo to be deleted
  bool changeState() {
    // if(status==null){
    //   status=false;
    // }
    // status = !status!;
    return true; //todo status delete it;
  }
}
