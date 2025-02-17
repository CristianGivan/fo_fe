import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

abstract class UserLinkEntity extends ItemEntity {
  final bool isSelected;

  const UserLinkEntity({
    required super.id,
    required super.remoteId,
    required super.subject,
    required this.isSelected,
  });

  @override
  bool get isEmpty;

  @override
  List<Object?> get props => [super.props, isSelected];
}
