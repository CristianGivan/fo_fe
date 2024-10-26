import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

enum TaskFilterCriteria { status, dateRange, reset }

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  TaskFilterCriteria? _selectedCriteria;
  TaskStatus? _selectedStatus;
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter Tasks'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCriteriaDropdown(),
          const SizedBox(height: 16),
          _buildSecondaryDropdown(),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: _applyFilter,
          child: const Text('Apply Filter'),
        ),
      ],
    );
  }

  Widget _buildCriteriaDropdown() {
    return DropdownButton<TaskFilterCriteria>(
      hint: const Text('Select Criteria'),
      value: _selectedCriteria,
      onChanged: (TaskFilterCriteria? newValue) {
        setState(() {
          _selectedCriteria = newValue;
          _selectedStatus = null;
          _selectedDateRange = null;
        });
      },
      items: TaskFilterCriteria.values.map((TaskFilterCriteria criteria) {
        return DropdownMenuItem<TaskFilterCriteria>(
          value: criteria,
          child: Text(criteria.toString().split('.').last),
        );
      }).toList(),
    );
  }

  Widget _buildSecondaryDropdown() {
    switch (_selectedCriteria) {
      case TaskFilterCriteria.status:
        return _buildStatusDropdown();
      case TaskFilterCriteria.dateRange:
        return _buildDateRangePicker();
      case TaskFilterCriteria.reset:
        return const Text('Click Apply to reset filters');
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildStatusDropdown() {
    return DropdownButton<TaskStatus>(
      hint: const Text('Select Status'),
      value: _selectedStatus,
      onChanged: (TaskStatus? newValue) {
        setState(() {
          _selectedStatus = newValue;
        });
      },
      items: TaskStatus.values.map((TaskStatus status) {
        return DropdownMenuItem<TaskStatus>(
          value: status,
          child: Text(taskStatusToStringMap[status]!),
        );
      }).toList(),
    );
  }

  Widget _buildDateRangePicker() {
    return ElevatedButton(
      onPressed: () async {
        final DateTimeRange? picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          setState(() {
            _selectedDateRange = picked;
          });
        }
      },
      child: Text(_selectedDateRange == null
          ? 'Select Date Range'
          : '${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}'),
    );
  }

  void _applyFilter() {
    final filterParams = _buildFilterParams();
    context
        .read<TaskBlocTask>()
        .add(TaskItemsFilterBlocEvent(filterParams: filterParams));
    context.pop();
  }

  FilterTasksParams _buildFilterParams() {
    final displayedTasks = _getTasksFromState(true);
    final originalTasks = _getTasksFromState(false);

    return FilterTasksParams(
      displayedTasks: displayedTasks,
      originalTasks: originalTasks,
      criteria: _selectedCriteria == TaskFilterCriteria.reset
          ? 'reset'
          : _selectedCriteria.toString().split('.').last,
      status: _selectedStatus,
      startDate: _selectedDateRange?.start,
      endDate: _selectedDateRange?.end,
    );
  }

  OrganizerItems<TaskEntity> _getTasksFromState(bool getDisplayed) {
    final state = context.read<TaskBlocTask>().state;
    if (state is TaskLoadedBlocState) {
      return getDisplayed ? state.displayedTasks : state.originalTasks;
    }
    return OrganizerItems<TaskEntity>.empty();
  }
}

void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const FilterDialog(),
  );
}
