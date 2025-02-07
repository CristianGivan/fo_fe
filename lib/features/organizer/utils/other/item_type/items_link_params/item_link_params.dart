import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemLinkParams extends Equatable {
  final int itemId;
  final int userId;
  final ItemsTypeEnum itemType;
  final String pushUpdateRoute;
  final String pushCreateLinkItemRoute;

  ItemLinkParams({
    required this.itemId,
    this.userId = 0,
    this.itemType = ItemsTypeEnum.undefine,
    required this.pushUpdateRoute,
    required this.pushCreateLinkItemRoute,
  });

  @override
  List<Object> get props => [itemId, userId, itemType, pushUpdateRoute, pushCreateLinkItemRoute];
}

class NoLinkParams extends ItemLinkParams {
  NoLinkParams() : super(itemId: 0, pushUpdateRoute: '', pushCreateLinkItemRoute: '');
}
