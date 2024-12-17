import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskParams extends ItemParams {
  final TaskEntity task;

  TaskParams({
    TaskEntity? task,
    super.id,
    super.idSet,
    super.forUserId,
    super.itemReturn,
  }) : task = task ?? TaskEntity.empty();

  @override
  List<Object> get props => [task, ...super.props];

  get itemReturnType => super.itemReturn;
}

class UpdateItemsToTaskParams<T extends OrganizerItemEntity> extends Equatable {
  final int taskId;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;

  const UpdateItemsToTaskParams({
    required this.taskId,
    required this.items,
    required this.updatedItems,
  });

  @override
  List<Object> get props => [taskId, items, updatedItems];
}

class FilterTasksParams extends Equatable {
  final OrganizerItems<TaskEntity> originalTasks;
  final OrganizerItems<TaskEntity> displayedTasks;
  final String criteria;
  final TaskStatus? status;
  final DateTime? startDate;
  final DateTime? endDate;

  const FilterTasksParams({
    required this.originalTasks,
    required this.displayedTasks,
    required this.criteria,
    this.status,
    this.startDate,
    this.endDate,
  });

  FilterTasksParams copyWith({
    OrganizerItems<TaskEntity>? originalTasks,
    OrganizerItems<TaskEntity>? displayedTasks,
    String? criteria,
    TaskStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return FilterTasksParams(
      originalTasks: originalTasks ?? this.originalTasks,
      displayedTasks: displayedTasks ?? this.displayedTasks,
      criteria: criteria ?? this.criteria,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props => [originalTasks, displayedTasks, criteria, status, startDate, endDate];
}

class SortTasksParams {
  final OrganizerItems<TaskEntity> tasks;
  final String criteria;

  SortTasksParams({required this.tasks, required this.criteria});

  SortTasksParams copyWith({
    OrganizerItems<TaskEntity>? tasks,
    String? criteria,
  }) {
    return SortTasksParams(
      tasks: tasks ?? this.tasks,
      criteria: criteria ?? this.criteria,
    );
  }

  List<Object> get props => [tasks, criteria];
}
