import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/config/reminder_route_names.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/config/tag_route_names.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/items/user/utils/config/user_route_names.dart';
import 'package:fo_fe/features/organizer/utils/entities/organizer_item_entity.dart';
import 'package:fo_fe/features/organizer/utils/other/items_type.dart';

enum ItemsTypeEnum { tag, reminder, user }

class ItemsTypeSelection {
  static ItemsType getItemType(ItemsTypeEnum type) {
    switch (type) {
      case ItemsTypeEnum.tag:
        return ItemsType<TagEntity>(
            type: type.toString(),
            routeName: TagRouterNames.tagRouteName,
            itemTextBuilder: (item) => item.subject);
      case ItemsTypeEnum.reminder:
        return ItemsType<ReminderEntity>(
            type: type.toString(),
            routeName: ReminderRouterNames.reminderRouteName,
            itemTextBuilder: (item) => item.subject);
      case ItemsTypeEnum.user:
        return ItemsType<UserEntity>(
            type: type.toString(),
            routeName: UserRouterNames.userRouteName,
            itemTextBuilder: (item) => item.name);
      default:
        //todo -t-
        return ItemsType<OrganizerItemEntity>(
          type: type.toString(),
          routeName: "/",
          itemTextBuilder: (item) => item.id.toString(),
        );
    }
  }
}
