import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AddItemParams extends Equatable {
  final ItemEntity item;
  final ItemLinkParams? itemLinkParams;

  const AddItemParams({required this.item, this.itemLinkParams});

  AddItemParams copyWith({
    ItemEntity? item,
    ItemLinkParams? itemLinkParams,
  }) {
    return AddItemParams(
      item: item ?? this.item,
      itemLinkParams: itemLinkParams ?? this.itemLinkParams,
    );
  }

  @override
  List<Object?> get props => [item, itemLinkParams];
}
