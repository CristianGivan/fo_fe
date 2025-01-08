import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum ItemType { entity, dto }

class ItemParams extends Equatable {
  final int id;
  final IdSet idSet;
  final int forUserId;
  final ItemsTypeEnum itemType;

  ItemParams({
    required this.id,
    IdSet? idSet,
    this.forUserId = 0,
    this.itemType = ItemsTypeEnum.undefine,
  }) : idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props => [id, idSet, forUserId, itemType];
}
