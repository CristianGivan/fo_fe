import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemLinkParams extends Equatable {
  final int itemId;
  final int userId;
  final ItemsTypeEnum itemType;
  final OrganizerLinkBloc? organizerLinkBloc;
  final String pushUpdateRoute;
  final String pushCreateLinkItemRoute;

  const ItemLinkParams({
    required this.itemId,
    this.userId = 0,
    this.itemType = ItemsTypeEnum.undefine,
    this.organizerLinkBloc,
    required this.pushUpdateRoute,
    required this.pushCreateLinkItemRoute,
  });

  const ItemLinkParams.empty() : this(itemId: 0, pushUpdateRoute: '', pushCreateLinkItemRoute: '');

  copyWith({
    int? itemId,
    int? userId,
    ItemsTypeEnum? itemType,
    OrganizerLinkBloc? organizerLinkBloc,
    String? pushUpdateRoute,
    String? pushCreateLinkItemRoute,
  });

  @override
  List<Object> get props => [itemId, userId, itemType, pushUpdateRoute, pushCreateLinkItemRoute];
}

class NoLinkParams extends ItemLinkParams {
  const NoLinkParams() : super(itemId: 0, pushUpdateRoute: '', pushCreateLinkItemRoute: '');

  @override
  copyWith(
      {int? itemId,
      int? userId,
      ItemsTypeEnum? itemType,
      OrganizerLinkBloc<ItemEntity>? organizerLinkBloc,
      String? pushUpdateRoute,
      String? pushCreateLinkItemRoute}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
