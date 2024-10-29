// lib/utils/organizer_item_navigator.dart
import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class OrganizerItemNavigator {
  static Future<void> navigateAndUpdateItems<T extends OrganizerItemEntity>(
    BuildContext context,
    int taskId,
    OrganizerItems<T> items,
    String routeName,
  ) async {
    final navigator = NavigatorFactory.getNavigator<T>(routeName: routeName);
    await navigator.navigateAndUpdateItems(context, taskId, items);
  }
}
