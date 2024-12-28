// lib/utils/reminder_item_navigator.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import 'base_item_navigator.dart';

class ReminderItemNavigator extends BaseItemNavigator<ReminderEntity> {
  ReminderItemNavigator() : super(ReminderRouterNames.reminderRouteName);

  @override
  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<ReminderEntity> items,
    OrganizerItems<ReminderEntity> updatedItems,
  ) {
    context.read<TaskReminderLinkBloc>().add(
          UpdateReminderItemsOfTaskBlocEvent(
            taskId: taskId,
            reminderItems: items,
            updatedReminderItems: updatedItems,
          ),
        );
  }
}
