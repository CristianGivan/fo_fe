import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
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
          _buildSecondaryWidget(),
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

  /// Dropdown for selecting criteria
  Widget _buildCriteriaDropdown() {
    return DropdownButton<TaskFilterCriteria>(
      hint: const Text('Select Criteria'),
      value: _selectedCriteria,
      onChanged: (TaskFilterCriteria? newValue) {
        setState(() {
          _selectedCriteria = newValue;
          _resetFilters();
        });
      },
      items: TaskFilterCriteria.values.map((criteria) {
        return DropdownMenuItem<TaskFilterCriteria>(
          value: criteria,
          child: Text(_criteriaToString(criteria)),
        );
      }).toList(),
    );
  }

  /// Builds a widget based on the selected filter criteria
  Widget _buildSecondaryWidget() {
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

  /// Dropdown for selecting task status
  Widget _buildStatusDropdown() {
    return DropdownButton<TaskStatus>(
      hint: const Text('Select Status'),
      value: _selectedStatus,
      onChanged: (TaskStatus? newValue) {
        setState(() {
          _selectedStatus = newValue;
        });
      },
      items: TaskStatus.values.map((status) {
        return DropdownMenuItem<TaskStatus>(
          value: status,
          child: Text(taskStatusMapToString[status]!),
        );
      }).toList(),
    );
  }

  /// Button for selecting a date range
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
      child: Text(
        _selectedDateRange == null
            ? 'Select Date Range'
            : '${_formatDate(_selectedDateRange!.start)} - ${_formatDate(_selectedDateRange!.end)}',
      ),
    );
  }

  /// Applies the selected filter
  void _applyFilter() {
    final filterParams = _buildFilterParams();
    context.read<TaskBloc>().add(TaskItemsFilterBlocEvent(filterParams: filterParams));
    Navigator.of(context).pop();
  }

  /// Builds the filter parameters
  FilterTasksParams _buildFilterParams() {
    return FilterTasksParams(
      displayedTaskItems: _getDisplayedTaskItems(),
      originalTaskItems: _getOriginalTaskItems(),
      criteria: _selectedCriteria == TaskFilterCriteria.reset
          ? 'reset'
          : _criteriaToString(_selectedCriteria),
      status: _selectedStatus,
      startDate: _selectedDateRange?.start,
      endDate: _selectedDateRange?.end,
    );
  }

  /// Gets the currently displayed task items from the TaskBloc state
  OrganizerItems<TaskDto> _getDisplayedTaskItems() {
    final state = context.read<TaskBloc>().state;
    return OrganizerItems.empty();
    // return state.displayedTaskItems as OrganizerItems<TaskDto>;
  }

  /// Gets the original task items from the TaskBloc state
  OrganizerItems<TaskDto> _getOriginalTaskItems() {
    final state = context.read<TaskBloc>().state;
    return OrganizerItems.empty();
    // return state.originalTaskItems as OrganizerItems<TaskDto>;
  }

  /// Resets the filters
  void _resetFilters() {
    setState(() {
      _selectedStatus = null;
      _selectedDateRange = null;
    });
  }

  /// Converts criteria enum to string
  String _criteriaToString(TaskFilterCriteria? criteria) {
    switch (criteria) {
      case TaskFilterCriteria.status:
        return 'Status';
      case TaskFilterCriteria.dateRange:
        return 'Date Range';
      case TaskFilterCriteria.reset:
        return 'Reset';
      default:
        return '';
    }
  }

  /// Formats a date for display
  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const FilterDialog(),
  );
}
