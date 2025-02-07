import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkIdsParams {
  final int itemId;
  final IdSet addedItems;
  final IdSet removedItems;

  ItemLinkIdsParams({
    required this.itemId,
    IdSet? addedItems,
    IdSet? removedItems,
  })  : addedItems = addedItems ?? IdSet.empty(),
        removedItems = removedItems ?? IdSet.empty();

  List<Object> get props => [itemId, addedItems, removedItems];
}
