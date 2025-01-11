import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemsLinkParams extends Equatable {
  final int id;
  final IdSet idSet;
  final int forUserId;
  final ItemsTypeEnum itemType;
  final String pushUpdateRoute;

  ItemsLinkParams({
    required this.id,
    IdSet? idSet,
    this.forUserId = 0,
    this.itemType = ItemsTypeEnum.undefine,
    required this.pushUpdateRoute,
  }) : idSet = idSet ?? IdSet.empty();

  @override
  List<Object> get props => [id, idSet, forUserId, itemType, pushUpdateRoute];
}
