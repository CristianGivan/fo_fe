import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../all_items/task/utils/task_exports.dart';

class TaskTagLinkParams extends ItemLinkParams {
  TaskTagLinkParams({
    required int id,
    int forUserId = 0,
  }) : super(
          itemId: id,
          userId: forUserId,
          itemType: ItemsTypeEnum.taskTag,
          pushUpdateRoute: TaskRouterNames.taskUpdateTagRouteName,
          pushCreateLinkItemRoute: TagRouterNames.tagAddRouteName,
        );

  factory TaskTagLinkParams.empty() => TaskTagLinkParams(id: 0);
}
