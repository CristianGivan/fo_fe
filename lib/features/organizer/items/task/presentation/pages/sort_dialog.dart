import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

class SortDialog extends StatefulWidget {
  @override
  _SortDialogState createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  String _selectedCriteria = 'date';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sort Tasks'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSortOption('date', 'By Date'),
          _buildSortOption('status', 'By Status'),
          _buildSortOption('priority', 'By Priority'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: _applySort,
          child: Text('Apply Sort'),
        ),
      ],
    );
  }

  Widget _buildSortOption(String value, String title) {
    return ListTile(
      title: Text(title),
      leading: Radio<String>(
        value: value,
        groupValue: _selectedCriteria,
        onChanged: (String? newValue) {
          setState(() {
            _selectedCriteria = newValue!;
          });
        },
      ),
    );
  }

  void _applySort() {
    final tasks = _getTasksFromState();
    final sortParams = SortTasksParams(
      tasks: tasks,
      criteria: _selectedCriteria,
    );

    context
        .read<TaskBlocTask>()
        .add(TaskItemsSortBlocEvent(sortParams: sortParams));
    Navigator.of(context).pop();
  }

  OrganizerItems<TaskEntity> _getTasksFromState() {
    final state = context.read<TaskBlocTask>().state;
    if (state is TaskLoadedBlocState) {
      return state.displayedTasks;
    }
    return OrganizerItems<TaskEntity>.empty();
  }
}

void showSortDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => SortDialog(),
  );
}
