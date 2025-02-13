import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../all_items/task/utils/task_exports.dart';

class TaskTagLinkParams extends ItemLinkParams {
  const TaskTagLinkParams({
    required int id,
    int forUserId = 0,
    OrganizerLinkBloc<ItemEntity>? organizerLinkBloc,
  }) : super(
          itemId: id,
          userId: forUserId,
          organizerLinkBloc: organizerLinkBloc,
          itemType: ItemsTypeEnum.taskTag,
          pushUpdateRoute: TaskRouterNames.taskUpdateTagRouteName,
          pushCreateLinkItemRoute: TagRouterNames.tagAddRouteName,
        );

  factory TaskTagLinkParams.empty() => TaskTagLinkParams(id: 0);

  @override
  TaskTagLinkParams copyWith({
    int? itemId,
    int? userId,
    ItemsTypeEnum? itemType,
    OrganizerLinkBloc<ItemEntity>? organizerLinkBloc,
    String? pushUpdateRoute,
    String? pushCreateLinkItemRoute,
  }) {
    return TaskTagLinkParams(
      id: itemId ?? this.itemId,
      forUserId: userId ?? this.userId,
      organizerLinkBloc: organizerLinkBloc ?? this.organizerLinkBloc,
    );
  }
}
