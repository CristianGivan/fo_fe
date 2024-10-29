import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class BaseItemNavigator<T extends OrganizerItemEntity> {
  final String routeName;

  BaseItemNavigator(this.routeName);

  Future<void> navigateAndUpdateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<T> items,
  ) async {
    OrganizerItems<T> updatedItems = await context.pushNamed<OrganizerItems<T>>(
          routeName,
          extra: items,
        ) ??
        OrganizerItems.empty();

    updateItems(context, taskId, items, updatedItems);
  }

  void updateItems(
    BuildContext context,
    int taskId,
    OrganizerItems<T> items,
    OrganizerItems<T> updatedItems,
  );
}
