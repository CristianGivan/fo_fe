// lib/utils/tag_item_navigator.dart
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/link_bloc_derive/item_tag_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class TagItemNavigator extends BaseItemNavigator<Tag> {
  TagItemNavigator() : super(TagRouterNames.tagRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<Tag> items,
    OrganizerItems<Tag> updatedItems,
  ) {
    context.read<ItemTagLinkBloc>().add(
            // UpdateTagItemsOfTaskBlocEvent(
            //   taskId: taskId,
            //   tagItems: items,
            //   updatedTagItems: updatedItems,
            // ),
            GetItemsOfItemBlocEvent(ItemsLinkParamsFactory.create(
          id: taskId,
          itemType: ItemsTypeEnum.taskUser,
        )));
  }
}
