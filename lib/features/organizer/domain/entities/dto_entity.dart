import 'package:fo_fe/features/organizer/domain/entities/item_entity.dart';

class DtoEntity extends ItemEntity {
  final bool isSelectedByUser;

  const DtoEntity({
    required int id,
    required int remoteId,
    required this.isSelectedByUser,
  }) : super(
          id: id,
          remoteId: remoteId,
        );

  @override
  List<Object?> get props => [id, remoteId, isSelectedByUser];
}
