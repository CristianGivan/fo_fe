import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum ItemReturn { entity, dto }

class ItemParams extends Equatable {
  final int id;
  final IdSet idSet;
  final int forUserId;
  final ItemReturn itemReturn;

  ItemParams({
    this.id = 0,
    IdSet? idSet,
    this.forUserId = 0,
    this.itemReturn = ItemReturn.entity,
  }) : idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props => [id, idSet, forUserId, itemReturn];
}
