// lib/utils/organizer_item_navigator.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerItemNavigator {
  static Future<void> navigateAndUpdateItems<T extends OrganizerItemEntity>(
    BuildContext context,
    int taskId,
    OrganizerItems<T> items,
    String routeName,
  ) async {
    OrganizerItems<T> updatedItems =
        await context.pushNamed<OrganizerItems<T>>(routeName, extra: items) ??
            OrganizerItems.empty();
    if (routeName == TagRouterNames.tagRouteName) {
      context.read<TaskTagLinkBloc>().add(
            UpdateTagItemsOfTaskBlocEvent(
              taskId: taskId,
              tagItems: items as OrganizerItems<TagEntity>,
              updatedTagItems: updatedItems as OrganizerItems<TagEntity>,
            ),
          );
    } else if (routeName == ReminderRouterNames.reminderRouteName) {
      //todo -t-
      context.read<TaskReminderLinkBloc>().add(
            UpdateReminderItemsOfTaskBlocEvent(
              taskId: taskId,
              reminderItems: items as OrganizerItems<ReminderEntity>,
              updatedReminderItems:
                  updatedItems as OrganizerItems<ReminderEntity>,
            ),
          );
    }
  }
}
