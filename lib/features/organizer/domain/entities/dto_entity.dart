import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

class DtoEntity extends ItemEntity {
  final bool isSelectedByUser;
  final String subject;

  const DtoEntity({
    required int id,
    required int remoteId,
    required this.isSelectedByUser,
    required this.subject,
  }) : super(
          id: id,
          remoteId: remoteId,
        );

  @override
  List<Object?> get props => [id, remoteId, isSelectedByUser];
}
