import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class SortDialog extends StatefulWidget {
  const SortDialog({super.key});

  @override
  _SortDialogState createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  String _selectedCriteria = 'date';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sort Tasks'),
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
          child: const Text('Apply Sort'),
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
    final tasks = _getTaskItemsFromState();
    final sortParams = SortTasksParams(
      tasks: tasks,
      criteria: _selectedCriteria,
    );

    context.read<TaskBloc>().add(TaskItemsSortBlocEvent(sortParams: sortParams));
    context.pop();
  }

  OrganizerItems<TaskDto> _getTaskItemsFromState() {
    //   final state = context.read<TaskBloc>().state;
    //   if (state is TaskDtoItemsLoadedBlocState) {
    //     return state.displayedTaskItems as OrganizerItems<TaskDto>;
    //   }
    //   return OrganizerItems<TaskDto>.empty();
    return OrganizerItems.empty();
  }
}

void showSortDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const SortDialog(),
  );
}
