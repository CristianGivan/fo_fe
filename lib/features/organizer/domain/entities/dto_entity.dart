import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class DtoEntity extends ItemEntity {
  final OrganizerItemEntity entity;
  final UserLinkEntity userLink;
  final bool isSelectedByUser;

  DtoEntity({
    required this.entity,
    required this.userLink,
  })  : isSelectedByUser = userLink.isSelected,
        super(
          id: entity.id,
          remoteId: entity.remoteId,
          subject: entity.subject,
        );

  @override
  List<Object?> get props => [entity, userLink];
}
