import 'package:fo_fe/features/organizer/domain/entities/user_link_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class DtoEntity extends ItemEntity {
  final OrganizerItemEntity entity;
  final UserLinkEntity userLink;

  DtoEntity({
    required this.entity,
    required this.userLink,
  }) : super(
          id: entity.id,
          remoteId: entity.remoteId,
        );

  @override
  List<Object?> get props => [entity, userLink];
}
