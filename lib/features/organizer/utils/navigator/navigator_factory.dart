// lib/utils/navigator_factory.dart
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/domain/entities/dto_entity.dart';
import 'package:fo_fe/features/organizer/utils/navigator/user_item_navigator.dart';

import 'base_item_navigator.dart';
import 'reminder_item_navigator.dart';
import 'tag_item_navigator.dart';

class NavigatorFactory<T extends DtoEntity> {
  static BaseItemNavigator<T> getNavigator<T extends DtoEntity>({required String routeName}) {
    switch (routeName) {
      case TagRouterNames.tagRouteName:
        return TagItemNavigator() as BaseItemNavigator<T>;
      case ReminderRouterNames.reminderRouteName:
        return ReminderItemNavigator() as BaseItemNavigator<T>;
      case UserRouterNames.userRouteName:
        return UserItemNavigator() as BaseItemNavigator<T>;
      default:
        throw UnsupportedError("Unsupported route: ${routeName}");
    }
  }
}
