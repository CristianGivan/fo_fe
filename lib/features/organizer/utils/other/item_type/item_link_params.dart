import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemLinkParams extends Equatable {
  final int itemId;
  final int userId;
  final IdSet idSet;
  final ItemsTypeEnum itemType;
  final String pushUpdateRoute;
  final String pushCreateLinkItemRoute;

  ItemLinkParams({
    required this.itemId,
    this.userId = 0,
    IdSet? idSet,
    this.itemType = ItemsTypeEnum.undefine,
    required this.pushUpdateRoute,
    required this.pushCreateLinkItemRoute,
  }) : idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props =>
      [itemId, idSet, userId, itemType, pushUpdateRoute, pushCreateLinkItemRoute];
}
