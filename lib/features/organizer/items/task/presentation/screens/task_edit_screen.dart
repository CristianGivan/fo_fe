import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/screen/tag_screen.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

import '../../../tag/presentation/pages/tag_list_link_page.dart';

class TaskEditScreen extends StatelessWidget {
  final TaskEntity task;

  const TaskEditScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    context.read<TaskTagLinkBloc>().add(GetTagsByTaskIdBlocEvent(task.id));
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFormFields(),
            const SizedBox(height: 20), // Add some space before the buttons
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(labelText: 'Subject'),
          controller: TextEditingController(text: task.subject),
        ),
        BlocBuilder<TaskTagLinkBloc, TaskTagLinkBlocState>(
          builder: (context, state) {
            if (state is TagLoadingBlocState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TagLoadedBlocState) {
              return TagListLinkPage(tags: state.tags);
            } else if (state is TagErrorBlocState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No Tags Available'));
            }
          },
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle save button press
          },
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () => _handleLinkButtonPress(context),
          child: const Text('Link'),
        ),
      ],
    );
  }

  Future<void> _handleLinkButtonPress(BuildContext context) async {
    final tagItems = await Navigator.push<List<TagEntity>>(
      context,
      MaterialPageRoute(
        builder: (context) => const TagScreen(),
      ),
    );
    if (tagItems != null) {
      context.read<TaskTagLinkBloc>().add(
            AddTagItemsToTaskBlocEvent(
              taskId: task.id,
              tags: tagItems.map((tag) => tag.id).toList(),
            ),
          );
    }
  }
}
