import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class ItemLinkParams extends Equatable {
  final int id;
  final ItemType itemType;

  ItemLinkParams({
    required this.id,
    this.itemType = ItemType.undefine,
  });

  @override
  List<Object> get props => [id, itemType];
}
