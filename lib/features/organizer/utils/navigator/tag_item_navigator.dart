import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class TagItemNavigator extends BaseItemNavigator<TagDto> {
  TagItemNavigator() : super(TagRouterNames.tagRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<TagDto> items,
    OrganizerItems<TagDto> updatedItems,
  ) {
    context
        .read<TaskTagLinksBloc>()
        .add(GetItemsOfItemBlocEvent(TaskLinkParamsFactory.create<TagEntity>(
          id: taskId,
          forUserId: 0,
        )));
  }
}
