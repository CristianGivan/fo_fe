import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskUserLinkEntity extends UserLinkEntity {
  final int _taskId;
  final int _userId;
  final DateTime? _linkingDate;
  final bool _isSelectedByUser;
  final int? _orderedByUser;

  TaskUserLinkEntity({
    int? id,
    int? taskId,
    int? userId,
    DateTime? linkingDate,
    bool? selectedByUser,
    int? orderedByUser,
  })  : _linkingDate = linkingDate ?? INITIAL_EPOCH_DATE,
        _taskId = taskId ?? 0,
        _userId = userId ?? 0,
        _isSelectedByUser = selectedByUser ?? false,
        _orderedByUser = orderedByUser ?? 0,
        super(id: id ?? 0, isSelected: selectedByUser ?? false, remoteId: 0, subject: '');

  static final TaskUserLinkEntity _emptyInstance = TaskUserLinkEntity();

  factory TaskUserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  DateTime? get linkingDate => _linkingDate;

  int get taskId => _taskId;

  int get userId => _userId;

  bool get isSelectedByUser => _isSelectedByUser;

  int? get orderedByUser => _orderedByUser;

  @override
  List<Object?> get props => [
        id,
        _linkingDate,
        _taskId,
        _userId,
        _isSelectedByUser,
        _orderedByUser,
      ];

  TaskUserLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? taskId,
    int? userId,
    bool? isSelectedByUser,
    int? orderedByUser,
  }) {
    return TaskUserLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? _linkingDate,
      taskId: taskId ?? _taskId,
      userId: userId ?? _userId,
      selectedByUser: isSelectedByUser ?? _isSelectedByUser,
      orderedByUser: orderedByUser ?? _orderedByUser,
    );
  }
}
