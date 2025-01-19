import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../all_items/task/utils/task_exports.dart';

class TaskTagLinkParams extends ItemLinkParams {
  TaskTagLinkParams({
    required int id,
    IdSet? idSet,
    int forUserId = 0,
  }) : super(
          itemId: id,
          idSet: idSet,
          userId: forUserId,
          itemType: ItemsTypeEnum.taskTag,
          pushUpdateRoute: TaskRouterNames.taskUpdateTagRouteName,
        );
}
