import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../all_items/task/utils/task_exports.dart';


class TaskUserLinkParams extends ItemsLinkParams {
  TaskUserLinkParams({
    required int id,
    IdSet? idSet,
    int forUserId = 0,
  }) : super(
          id: id,
          idSet: idSet,
          forUserId: forUserId,
          itemType: ItemsTypeEnum.taskUser,
          pushUpdateRoute: TaskRouterNames.taskUpdateTagRouteName,
        );
}
