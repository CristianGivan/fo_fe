import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_list_link_page.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskTagListPage extends StatelessWidget {
  final OrganizerItems<TagEntity> tagItems;
  final TaskEntity task;

  const TaskTagListPage({super.key, required this.tagItems, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TagListLinkPage(tagItems: tagItems),
        ElevatedButton(
          onPressed: () => _handleUpdateTagItems(context),
          child: const Text('Update Tags'),
        ),
      ],
    );
  }

  Future<void> _handleUpdateTagItems(BuildContext context) async {
    TagNavigator.navigateAndUpdateTags(
      context,
      task.id,
      tagItems,
    );
  }
}
