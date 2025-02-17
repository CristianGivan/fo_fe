import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserUserLinkEntity extends UserLinkEntity {
  final int _userId;
  final int _userLinkedId;
  final DateTime? _linkingDate;
  final bool _isSelectedByUser;
  final int? _orderedByUser;

  UserUserLinkEntity({
    int? id,
    int? taskId,
    int? userId,
    DateTime? linkingDate,
    bool? isSelectedByUser,
    int? orderedByUser,
  })  : _linkingDate = linkingDate ?? INITIAL_EPOCH_DATE,
        _userId = taskId ?? 0,
        _userLinkedId = userId ?? 0,
        _isSelectedByUser = isSelectedByUser ?? false,
        _orderedByUser = orderedByUser ?? 0,
        super(id: id ?? 0, isSelected: isSelectedByUser ?? false, remoteId: 0);

  static final UserUserLinkEntity _emptyInstance = UserUserLinkEntity();

  factory UserUserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  DateTime? get linkingDate => _linkingDate;

  int get taskId => _userId;

  int get userId => _userLinkedId;

  bool get isSelectedByUser => _isSelectedByUser;

  int? get orderedByUser => _orderedByUser;

  @override
  List<Object?> get props => [
        id,
        _linkingDate,
        _userId,
        _userLinkedId,
        _isSelectedByUser,
        _orderedByUser,
      ];

  UserUserLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? userId,
    int? userLinkedId,
    bool? isSelectedByUser,
    int? orderedByUser,
  }) {
    return UserUserLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? _linkingDate,
      taskId: userId ?? _userId,
      userId: userLinkedId ?? _userLinkedId,
      isSelectedByUser: isSelectedByUser ?? _isSelectedByUser,
      orderedByUser: orderedByUser ?? _orderedByUser,
    );
  }
}
