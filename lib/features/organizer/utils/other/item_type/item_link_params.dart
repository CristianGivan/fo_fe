import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemLinkParams extends Equatable {
  final int itemId;
  final int userId;
  final IdSet idSet;
  final ItemsTypeEnum itemType;
  final String pushUpdateRoute;

  ItemLinkParams({
    required this.itemId,
    IdSet? idSet,
    this.userId = 0,
    this.itemType = ItemsTypeEnum.undefine,
    required this.pushUpdateRoute,
  }) : idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props => [itemId, idSet, userId, itemType, pushUpdateRoute];
}
