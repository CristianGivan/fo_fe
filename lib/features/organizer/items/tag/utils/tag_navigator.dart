// lib/utils/tag_navigator.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/screen/tag_screen.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TagNavigator {
  static Future<void> navigateAndAddTags(
      BuildContext context, int taskId) async {
    final tagItems = await Navigator.push<List<TagEntity>>(
      context,
      MaterialPageRoute(
        builder: (context) => const TagScreen(),
      ),
    );
    if (tagItems != null) {
      context.read<TaskTagLinkBloc>().add(
            AddTagItemsToTaskBlocEvent(
              taskId: taskId,
              tags: tagItems.map((tag) => tag.id).toList(),
            ),
          );
    }
  }
}
