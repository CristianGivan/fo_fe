import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item_list_link_page.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskTagListPage extends StatelessWidget {
  final OrganizerItems<TagEntity> tagItems;
  final TaskEntity task;

  const TaskTagListPage({super.key, required this.tagItems, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemListLinkPage(
          items: tagItems,
          itemTextBuilder: (tag) => tag.subject,
        ),
        ElevatedButton(
          onPressed: () => _handleUpdateTagItems(context),
          child: const Text('Update Tags'),
        ),
      ],
    );
  }

  Future<void> _handleUpdateTagItems(BuildContext context) async {
    final navigator = NavigatorFactory.getNavigator<TagEntity>(
      routeName: TagRouterNames.tagRouteName,
    );
    await navigator.navigateAndUpdateItems(
      context,
      task.id,
      tagItems,
    );
  }
}
