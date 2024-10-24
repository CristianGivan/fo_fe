import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class TaskEditScreen extends StatefulWidget {
  final TaskEntity task;

  const TaskEditScreen({super.key, required this.task});

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  OrganizerItems<TagEntity> taskTagItems = OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    _loadTags(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildFormFields(),
            const SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  void _loadTags(BuildContext context) {
    context.read<TaskTagLinkBloc>().add(GetTagsByTaskIdBlocEvent(widget.task.id));
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildSubjectField(),
        _buildTagList(),
      ],
    );
  }

  Widget _buildSubjectField() {
    return TextField(
      decoration: const InputDecoration(labelText: 'Subject'),
      controller: TextEditingController(text: widget.task.subject),
    );
  }

  Widget _buildTagList() {
    return BlocBuilder<TaskTagLinkBloc, TaskTagLinkBlocState>(
      builder: (context, state) {
        if (state is TagLoadingBlocState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TagLoadedBlocState) {
          taskTagItems = state.tagItems;
          return _buildTagListContent();
        } else if (state is TagItemsAddedToTaskBlocState) {
          taskTagItems = state.tagItems;
          return _buildTagListContent();
        } else if (state is TagErrorBlocState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Tags Available'));
        }
      },
    );
  }

  Widget _buildTagListContent() {
    if (taskTagItems.isEmpty()) {
      return const Center(child: Text('No Tags Available'));
    }
    return TaskTagListPage(task: widget.task, tagItems: taskTagItems);
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: _handleSaveButtonPress,
          child: const Text('Save'),
        ),
        ElevatedButton(
          onPressed: () => _handleLinkButtonPress(context),
          child: const Text('Link'),
        ),
      ],
    );
  }

  void _handleSaveButtonPress() {
    // Handle save button press
  }

  Future<void> _handleLinkButtonPress(BuildContext context) async {
    await TagNavigator.navigateAndUpdateTags(
      context,
      widget.task.id,
      taskTagItems,
    );
  }
}
