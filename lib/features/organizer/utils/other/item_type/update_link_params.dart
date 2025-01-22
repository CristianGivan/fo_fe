import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateLinkParams<T extends ItemEntity> {
  final ItemLinkParams itemLinkParams;
  final OrganizerItems<T> addedItems;
  final OrganizerItems<T> removedItems;

  UpdateLinkParams({
    required this.itemLinkParams,
    OrganizerItems<T>? addedItems,
    OrganizerItems<T>? removedItems,
  })  : addedItems = addedItems ?? OrganizerItems.empty(),
        removedItems = removedItems ?? OrganizerItems.empty();

  get itemId => itemLinkParams.itemId;

  get itemType => itemLinkParams.itemType;

  get pushUpdateRoute => itemLinkParams.pushUpdateRoute;

  get pushCreateLinkItemRoute => itemLinkParams.pushCreateLinkItemRoute;

  List<Object> get props => [itemLinkParams, addedItems, removedItems];
}
