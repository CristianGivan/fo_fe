import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/config/reminder_route_names.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/config/tag_route_names.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/items/user/utils/config/user_route_names.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type.dart';

enum ItemsTypeEnum { tag, reminder, user }

class ItemsTypeSelection {
  static ItemsType getItemType(ItemsTypeEnum type) {
    switch (type) {
      case ItemsTypeEnum.tag:
        return ItemsType(
          type: type.name,
          routeName: TagRouterNames.tagRouteName,
          itemTextBuilder: (item) => (item as TagEntity).subject,
        );
      case ItemsTypeEnum.reminder:
        return ItemsType(
          type: type.name,
          routeName: ReminderRouterNames.reminderRouteName,
          itemTextBuilder: (item) => (item as ReminderEntity).subject,
        );
      case ItemsTypeEnum.user:
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
