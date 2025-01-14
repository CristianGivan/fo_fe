import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateItemsOfItemParams<T extends DtoEntity> extends ItemParams {
  final int itemId;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;
  final OrganizerItems<T> addedItems;
  final OrganizerItems<T> removedItems;

  UpdateItemsOfItemParams({
    required this.itemId,
    super.itemType,
    OrganizerItems<T>? items,
    OrganizerItems<T>? updatedItems,
    OrganizerItems<T>? addedItems,
    OrganizerItems<T>? removedItems,
  })  : items = items ?? OrganizerItems.empty(),
        updatedItems = updatedItems ?? OrganizerItems.empty(),
        addedItems = addedItems ?? OrganizerItems.empty(),
        removedItems = removedItems ?? OrganizerItems.empty(),
        super(id: itemId);

  @override
  List<Object> get props => [itemId, items, updatedItems, addedItems, removedItems];
}
