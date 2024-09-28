import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_list_link_page.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TaskTagListPage extends StatelessWidget {
  final OrganizerItems<TagEntity> tags;
  final TaskEntity task;

  const TaskTagListPage({super.key, required this.tags, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TagListLinkPage(tags: tags),
        ElevatedButton(
          onPressed: () => _handleUpdateTagItems(context),
          child: const Text('Update Tags'),
        ),
      ],
    );
  }

  Future<void> _handleUpdateTagItems(BuildContext context) async {
    TagNavigator.navigateAndAddTags(context, task.id);
  }
}
