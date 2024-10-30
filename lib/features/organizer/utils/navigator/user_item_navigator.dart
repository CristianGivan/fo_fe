// lib/utils/user_item_navigator.dart
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class UserItemNavigator extends BaseItemNavigator<UserEntity> {
  UserItemNavigator() : super(UserRouterNames.userRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<UserEntity> items,
    OrganizerItems<UserEntity> updatedItems,
  ) {
    context.read<TaskUserLinkBloc>().add(
          UpdateUserItemsOfTaskBlocEvent(
            taskId: taskId,
            userItems: items,
            updatedUserItems: updatedItems,
          ),
        );
  }
}
