// lib/utils/tag_item_navigator.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class TagItemNavigator extends BaseItemNavigator<TagEntity> {
  TagItemNavigator() : super(TagRouterNames.tagRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<TagEntity> items,
    OrganizerItems<TagEntity> updatedItems,
  ) {
    context.read<TaskTagLinkBloc>().add(
          UpdateTagItemsOfTaskBlocEvent(
            taskId: taskId,
            tagItems: items,
            updatedTagItems: updatedItems,
          ),
        );
  }
}
