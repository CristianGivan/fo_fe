import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskTagLinkEntity extends ItemEntity {
  final DateTime linkingDate;
  final int taskId;
  final int tagId;

  const TaskTagLinkEntity({
    required super.id,
    required this.linkingDate,
    required this.taskId,
    required this.tagId,
  }) : super(remoteId: 0, subject: '');

  static final TaskTagLinkEntity _emptyInstance = TaskTagLinkEntity(
    id: 0,
    linkingDate: INITIAL_EPOCH_DATE,
    taskId: 0,
    tagId: 0,
  );

  factory TaskTagLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  TaskTagLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? taskId,
    int? tagId,
  }) {
    return TaskTagLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? this.linkingDate,
      taskId: taskId ?? this.taskId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  List<Object?> get props => [id, linkingDate, taskId, tagId];
}
