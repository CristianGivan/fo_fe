// lib/utils/user_item_navigator.dart
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class UserItemNavigator extends BaseItemNavigator<UserDto> {
  UserItemNavigator() : super(UserRouterNames.userRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<UserDto> items,
    OrganizerItems<UserDto> updatedItems,
  ) {
    context.read<TaskUserLinksBloc>().add(GetItemsOfItemBlocEvent(TaskLinkParamsFactory.create(
          id: taskId,
          forUserId: 0,
        )));
  }
}
