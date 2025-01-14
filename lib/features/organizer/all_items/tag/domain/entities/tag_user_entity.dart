import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagUserLinkEntity extends UserLinkEntity {
  final int _tagId;
  final int _userId;
  final DateTime? _linkingDate;
  final bool _isSelectedByUser;
  final int? _orderedByUser;

  TagUserLinkEntity({
    int? id,
    int? tagId,
    int? userId,
    DateTime? linkingDate,
    bool? selectedByUser,
    int? orderedByUser,
  })  : _linkingDate = linkingDate ?? INITIAL_EPOCH_DATE,
        _tagId = tagId ?? 0,
        _userId = userId ?? 0,
        _isSelectedByUser = selectedByUser ?? false,
        _orderedByUser = orderedByUser ?? 0,
        super(id: id ?? 0, isSelected: selectedByUser ?? false);

  static final TagUserLinkEntity _emptyInstance = TagUserLinkEntity();

  factory TagUserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  DateTime? get linkingDate => _linkingDate;

  int get tagId => _tagId;

  int get userId => _userId;

  bool get isSelectedByUser => _isSelectedByUser;

  int? get orderedByUser => _orderedByUser;

  @override
  List<Object?> get props => [
        id,
        _linkingDate,
        _tagId,
        _userId,
        _isSelectedByUser,
        _orderedByUser,
      ];

  TagUserLinkEntity copyWith({
    int? id,
    DateTime? linkingDate,
    int? tagId,
    int? userId,
    bool? isSelectedByUser,
    int? orderedByUser,
  }) {
    return TagUserLinkEntity(
      id: id ?? this.id,
      linkingDate: linkingDate ?? _linkingDate,
      tagId: tagId ?? _tagId,
      userId: userId ?? _userId,
      selectedByUser: isSelectedByUser ?? _isSelectedByUser,
      orderedByUser: orderedByUser ?? _orderedByUser,
    );
  }
}
