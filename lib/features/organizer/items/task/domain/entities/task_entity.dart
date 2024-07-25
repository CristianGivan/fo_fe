import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/const/constants.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/util/organizer_enums.dart';

class TaskEntity extends OrganizerItemEntity with EquatableMixin {
  final String _subject;
  final DateTime? _startDate;
  final DateTime? _endDate;
  final double? _workingTime;
  final double? _estimatedTime;
  final double? _estimatedLeftTime;
  final double? _workingProgress;
  final TaskStatus? _taskStatus;

  TaskEntity({
    int? id,
    DateTime? createdDate,
    int? creatorId,
    int? remoteId,
    DateTime? lastUpdate,
    DateTime? lastViewDate,
    int? remoteViews,
    int? views,
    String? checksum,
    String? subject,
    DateTime? startDate,
    DateTime? endDate,
    double? workingTime,
    double? estimatedTime,
    double? estimatedLeftTime,
    double? workingProgress,
    TaskStatus? taskStatus,
  })  : _subject = subject ?? "",
        _startDate = startDate ?? INITIAL_EPOCH_DATE,
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
          lastAccessedDate: lastViewDate ?? INITIAL_EPOCH_DATE,
          remoteAccesses: remoteViews ?? 0,
          accesses: views ?? 0,
          checksum: checksum ?? '',
        );

  factory TaskEntity.empty() {
    return TaskEntity();
  }

  @override
  List<Object?> get props => [
        ...super.props,
        _subject,
        _startDate,
        _endDate,
        _workingTime,
        _estimatedTime,
        _estimatedLeftTime,
        _workingProgress,
        _taskStatus,
      ];

  // Getters for all fields
  String get subject => _subject;

  DateTime? get startDate => _startDate;

  DateTime? get endDate => _endDate;

  double? get workingTime => _workingTime;

  double? get estimatedTime => _estimatedTime;

  double? get estimatedLeftTime => _estimatedLeftTime;

  double? get workingProgress => _workingProgress;

  TaskStatus? get taskStatus => _taskStatus;

  TaskEntity copyWith({
    int? id,
    String? subject,
    DateTime? createdDate,
    int? creatorId,
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
  }) {
    return TaskEntity(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      createdDate: createdDate ?? this.createdDate,
      creatorId: creatorId ?? this.creatorId,
      remoteId: remoteId ?? this.remoteId,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      lastViewDate: lastViewDate ?? this.lastAccessedDate,
      remoteViews: remoteViews ?? this.remoteAccesses,
      views: views ?? this.accesses,
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
