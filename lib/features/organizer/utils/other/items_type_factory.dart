import 'package:fo_fe/features/organizer/all_items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/config/reminder_route_names.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/config/tag_route_names.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/config/user_route_names.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type.dart';

class ItemsTypeFactory {
  static ItemsType getItemType(ItemType type) {
    switch (type) {
      case ItemType.tag:
        return ItemsType(
          type: type.name,
          routeName: TagRouterNames.tagRouteName,
          itemTextBuilder: (item) => (item as TagEntity).subject,
        );
      case ItemType.reminder:
        return ItemsType(
          type: type.name,
          routeName: ReminderRouterNames.reminderRouteName,
          itemTextBuilder: (item) => (item as ReminderEntity).subject,
        );
      case ItemType.user:
        return ItemsType(
          type: type.name,
          routeName: UserRouterNames.userRouteName,
          itemTextBuilder: (item) => (item as UserEntity).name,
        );
      default:
        return ItemsType(
          type: type.toString(),
          routeName: "/",
          itemTextBuilder: (item) => item.id.toString(),
        );
    }
  }
}
