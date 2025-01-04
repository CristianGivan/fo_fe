import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEntity extends OrganizerItemEntity {
  final DateTime? _startDate;
  final DateTime? _endDate;
  final double? _workingTime;
  final double? _estimatedTime;
  final double? _estimatedLeftTime;
  final double? _workingProgress;
  final TaskStatus? _taskStatus;

  TaskEntity({
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
    super.subject,
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
    int? remoteViews,
    int? views,
    String? checksum,
  })  : _startDate = startDate ?? INITIAL_EPOCH_DATE,
        _endDate = endDate ?? INITIAL_EPOCH_DATE,
        _workingTime = workingTime ?? 0,
        _estimatedTime = estimatedTime ?? 0,
        _estimatedLeftTime = estimatedLeftTime ?? 0,
        _workingProgress = workingProgress ?? 0,
        _taskStatus = taskStatus ?? TaskStatus.undefined,
        super(
          id: id ?? 0,
          createdDate: createdDate ?? INITIAL_EPOCH_DATE,
          creatorId: creatorId ?? 0,
          remoteId: remoteId ?? 0,
          lastUpdate: lastUpdate ?? INITIAL_EPOCH_DATE,
          lastViewedDate: lastViewedDate ?? INITIAL_EPOCH_DATE,
          remoteViews: remoteViews ?? 0,
          views: views ?? 0,
          checksum: checksum ?? '',
        );

  static final TaskEntity _emptyInstance = TaskEntity();

  factory TaskEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

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
      ];

  DateTime? get startDate => _startDate;

  DateTime? get endDate => _endDate;

  double? get workingTime => _workingTime;

  double? get estimatedTime => _estimatedTime;

  double? get estimatedLeftTime => _estimatedLeftTime;

  double? get workingProgress => _workingProgress;

  TaskStatus? get taskStatus => _taskStatus;

  TaskEntity copyWith({
    String? subject,
    int? id,
    int? creatorId,
    int? remoteId,
    DateTime? createdDate,
    DateTime? lastUpdate,
    DateTime? lastViewedDate,
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
  }) {
    return TaskEntity(
      subject: subject ?? this.subject,
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      createdDate: createdDate ?? this.createdDate,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewedDate: lastViewedDate ?? this.lastViewedDate,
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
    );
  }
}
