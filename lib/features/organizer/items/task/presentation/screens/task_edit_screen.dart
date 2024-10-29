import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/presentation/pages/task_reminder_list_page.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskEditScreen extends StatefulWidget {
  final TaskEntity task;

  const TaskEditScreen({super.key, required this.task});

  @override
  _TaskEditScreenState createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  OrganizerItems<TagEntity> taskTagItems = OrganizerItems.empty();
  OrganizerItems<ReminderEntity> taskReminderItems = OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    _loadTagsAndReminders(context);
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

  void _loadTagsAndReminders(BuildContext context) {
    context
        .read<TaskTagLinkBloc>()
        .add(GetTagItemsByTaskIdBlocEvent(widget.task.id));
    context
        .read<TaskReminderLinkBloc>()
        .add(GetReminderItemsByTaskIdBlocEvent(widget.task.id));
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildSubjectField(),
        _buildTagList(),
        const Text("Reminder"),
        _buildReminderList(),
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
        if (state is TaskTagLoadingBlocState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskTagLoadedBlocState) {
          taskTagItems = state.tagItems;
          return _buildTagListContent();
        } else if (state is TagItemsAddedToTaskBlocState) {
          taskTagItems = state.tagItems;
          return _buildTagListContent();
        } else if (state is TaskTagErrorBlocState) {
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

  // New method for reminder list
  Widget _buildReminderList() {
    return BlocBuilder<TaskReminderLinkBloc, TaskReminderLinkBlocState>(
      builder: (context, state) {
        if (state is TaskReminderLoadingBlocState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TaskReminderLoadedBlocState) {
          taskReminderItems = state.reminderItems;
          return _buildReminderListContent();
        } else if (state is ReminderItemsAddedToTaskBlocState) {
          taskReminderItems = state.reminderItems;
          return _buildReminderListContent();
        } else if (state is TaskReminderErrorBlocState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No Reminders Available'));
        }
      },
    );
  }

  Widget _buildReminderListContent() {
    if (taskReminderItems.isEmpty()) {
      return const Center(child: Text('No Reminders Available'));
    }
    return TaskReminderListPage(
        task: widget.task, reminderItems: taskReminderItems);
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
          onPressed: () => _handleLinkTagButtonPress(context),
          child: const Text('Link Tag'),
        ),
        ElevatedButton(
          onPressed: () => _handleLinkReminderButtonPress(context),
          child: const Text('Link Reminder'),
        ),
      ],
    );
  }

  void _handleSaveButtonPress() {
    // Handle save button press
  }

  Future<void> _handleLinkTagButtonPress(BuildContext context) async {
    await OrganizerItemNavigator.navigateAndUpdateItems<TagEntity>(
      context,
      widget.task.id,
      taskTagItems,
      TagRouterNames.tagRouteName,
    );
  }

  Future<void> _handleLinkReminderButtonPress(BuildContext context) async {
    await OrganizerItemNavigator.navigateAndUpdateItems<ReminderEntity>(
      context,
      widget.task.id,
      taskReminderItems,
      ReminderRouterNames.reminderRouteName,
    );
  }
}
