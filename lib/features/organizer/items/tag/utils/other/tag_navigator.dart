// lib/utils/tag_navigator.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagNavigator {
  //todo -i-  implement navigateAndUpdateTags to not DRY
  static Future<void> navigateAndUpdateTags(BuildContext context, int taskId,
      OrganizerItems<TagEntity> tagItems) async {
    OrganizerItems<TagEntity> updatedTagItems =
        await context.pushNamed<OrganizerItems<TagEntity>>(
              TagRouterNames.tagRouteName,
              extra: tagItems,
            ) ??
            OrganizerItems.empty();

    context.read<TaskTagLinkBloc>().add(
          UpdateTagItemsOfTaskBlocEvent(
            taskId: taskId,
            tagItems: tagItems,
            updatedTagItems: updatedTagItems,
          ),
        );
  }
}
