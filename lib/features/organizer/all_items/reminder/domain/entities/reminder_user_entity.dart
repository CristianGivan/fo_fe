import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ReminderUserLinkEntity extends UserLinkEntity {
  final int _reminderId;
  final int _userId;
  final DateTime? _linkingDate;
  final bool _isSelectedByUser;
  final int? _orderedByUser;

  ReminderUserLinkEntity({
    int? id,
    int? reminderId,
    int? userId,
    DateTime? linkingDate,
    bool? selectedByUser,
    int? orderedByUser,
  })  : _linkingDate = linkingDate ?? INITIAL_EPOCH_DATE,
        _reminderId = reminderId ?? 0,
        _userId = userId ?? 0,
        _isSelectedByUser = selectedByUser ?? false,
        _orderedByUser = orderedByUser ?? 0,
        super(id: id ?? 0, isSelected: selectedByUser ?? false, remoteId: 0);

  static final ReminderUserLinkEntity _emptyInstance = ReminderUserLinkEntity();

  factory ReminderUserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  DateTime? get linkingDate => _linkingDate;

  int get reminderId => _reminderId;

  int get userId => _userId;

  bool get isSelectedByUser => _isSelectedByUser;

  int? get orderedByUser => _orderedByUser;

  @override
  List<Object?> get props => [
        id,
        _linkingDate,
        _reminderId,
        _userId,
        _isSelectedByUser,
        _orderedByUser,
      ];

  ReminderUserLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? reminderId,
    int? userId,
    bool? isSelectedByUser,
    int? orderedByUser,
  }) {
    return ReminderUserLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? _linkingDate,
      reminderId: reminderId ?? _reminderId,
      userId: userId ?? _userId,
      selectedByUser: isSelectedByUser ?? _isSelectedByUser,
      orderedByUser: orderedByUser ?? _orderedByUser,
    );
  }
}
