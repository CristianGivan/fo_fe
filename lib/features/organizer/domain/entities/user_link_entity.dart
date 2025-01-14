import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

class UserLinkEntity extends ItemEntity {
  final bool isSelected;

  const UserLinkEntity({
    super.id,
    super.remoteId,
    required this.isSelected,
  });

  static final UserLinkEntity _emptyInstance = UserLinkEntity(
    id: 0,
    remoteId: 0,
    isSelected: false,
  );

  factory UserLinkEntity.empty() => _emptyInstance;

  @override
  bool get isEmpty => this == _emptyInstance;

  @override
  List<Object?> get props => [super.props, isSelected];
}
