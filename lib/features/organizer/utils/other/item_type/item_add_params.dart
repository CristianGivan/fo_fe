import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AddItemParams extends Equatable {
  final ItemEntity item;
  final int linkedItemId;
  final ItemsTypeEnum itemType;

  AddItemParams({item, linkedItemId, itemType})
      : item = item ?? ItemEntity.empty(),
        linkedItemId = linkedItemId ?? 0,
        itemType = itemType ?? ItemsTypeEnum.undefine;

  @override
  List<Object> get props => [item, linkedItemId, itemType];
}
