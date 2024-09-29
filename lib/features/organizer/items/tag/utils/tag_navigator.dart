// lib/utils/tag_navigator.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/screen/tag_screen.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TagNavigator {
  static Future<void> navigateAndAddTags(BuildContext context, int taskId,
      OrganizerItems<TagEntity> tagItems) async {
    OrganizerItems<TagEntity>? newTagItems =
        await Navigator.push<OrganizerItems<TagEntity>>(
      context,
      MaterialPageRoute(
        builder: (context) => TagScreen(tagItems: tagItems),
      ),
    );

    //todo cg  implement removeTagItems

    OrganizerItems<TagEntity>? addTagItems =
        tagItems.getAddedItems(newTagItems);
    OrganizerItems<TagEntity>? removeTagItems =
        tagItems.getRemovedItems(newTagItems);
    if (addTagItems != null) {
      context.read<TaskTagLinkBloc>().add(
            AddTagItemsToTaskBlocEvent(
              taskId: taskId,
              tags: addTagItems.map((tag) => tag.id).toList(),
            ),
          );
    }
  }
}
