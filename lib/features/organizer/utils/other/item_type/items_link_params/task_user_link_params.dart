import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../all_items/task/utils/task_exports.dart';

class TaskUserLinkParams extends ItemLinkParams {
  TaskUserLinkParams({
    required int id,
    required int forUserId,
    IdSet? idSet,
  }) : super(
          itemId: id,
          userId: forUserId,
          itemType: ItemsTypeEnum.taskUser,
          pushUpdateRoute: TaskRouterNames.taskUpdateUserRouteName,
          pushCreateLinkItemRoute: UserRouterNames.userAddRouteName,
        );
}
