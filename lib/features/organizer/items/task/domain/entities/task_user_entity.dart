import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskUserLinkEntity extends ItemEntity {
  final DateTime? _linkingDate;
  final int? _taskId;
  final int? _userId;
  final bool? _selectedByUser;
  final int? _orderedByUser;

  TaskUserLinkEntity({
    int? id,
    DateTime? linkingDate,
    int? taskId,
    int? userId,
    bool? selectedByUser,
    int? orderedByUser,
  })  : _linkingDate = linkingDate ?? INITIAL_EPOCH_DATE,
        _taskId = taskId ?? 0,
        _userId = userId ?? 0,
        _selectedByUser = selectedByUser ?? false,
        _orderedByUser = orderedByUser ?? 0,
        super(id: id ?? 0);

  static final TaskUserLinkEntity _emptyInstance = TaskUserLinkEntity();

  factory TaskUserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  DateTime? get linkingDate => _linkingDate;

  int? get taskId => _taskId;

  int? get userId => _userId;

  bool? get isSelectedByUser => _selectedByUser;

  int? get orderedByUser => _orderedByUser;

  @override
  List<Object?> get props => [
        id,
        _linkingDate,
        _taskId,
        _userId,
        _selectedByUser,
        _orderedByUser,
      ];

  TaskUserLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? taskId,
    int? userId,
    bool? selectedByUser,
    int? orderedByUser,
  }) {
    return TaskUserLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? _linkingDate,
      taskId: taskId ?? _taskId,
      userId: userId ?? _userId,
      selectedByUser: selectedByUser ?? _selectedByUser,
      orderedByUser: orderedByUser ?? _orderedByUser,
    );
  }
}
