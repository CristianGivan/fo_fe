import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskParams extends ItemParams {
  final TaskEntity taskEntity;
  final TaskUserLinkEntity taskUserLinkEntity;
  final TaskDto taskDto;
  final OrganizerItems<TaskDto> taskItems;

  TaskParams({
    TaskEntity? task,
    TaskUserLinkEntity? taskUserLinkEntity,
    TaskDto? taskDto,
    int? id,
    IdSet? idSet,
    int? forUserId,
    ItemReturn? itemReturn,
    OrganizerItems<TaskDto>? taskItems,
  })  : taskEntity = task ?? TaskEntity.empty(),
        taskUserLinkEntity = taskUserLinkEntity ?? TaskUserLinkEntity.empty(),
        taskDto =
            taskDto ?? TaskDto(task: TaskEntity.empty(), taskUserLink: TaskUserLinkEntity.empty()),
        taskItems = taskItems ?? OrganizerItems.empty(),
        super(
          id: id ?? 0,
          idSet: idSet ?? IdSet.empty(),
          forUserId: forUserId ?? 0,
          itemReturn: itemReturn ?? ItemReturn.dto,
        );

  TaskParams copyWith({
    TaskEntity? task,
    TaskUserLinkEntity? taskUserLinkEntity,
    TaskDto? taskDto,
    int? id,
    IdSet? idSet,
    int? forUserId,
    ItemReturn? itemReturn,
  }) {
    return TaskParams(
      task: task ?? this.taskEntity,
      taskUserLinkEntity: taskUserLinkEntity ?? this.taskUserLinkEntity,
      taskDto: taskDto ?? this.taskDto,
      id: id ?? this.id,
      idSet: idSet ?? this.idSet,
      forUserId: forUserId ?? this.forUserId,
      itemReturn: itemReturn ?? this.itemReturn,
    );
  }

  @override
  List<Object> get props => [taskEntity, taskUserLinkEntity, taskDto, ...super.props];

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
  final OrganizerItems<TaskDto> originalTaskItems;
  final OrganizerItems<TaskDto> displayedTaskItems;
  final String criteria;
  final TaskStatus? status;
  final DateTime? startDate;
  final DateTime? endDate;

  const FilterTasksParams({
    required this.originalTaskItems,
    required this.displayedTaskItems,
    required this.criteria,
    this.status,
    this.startDate,
    this.endDate,
  });

  FilterTasksParams copyWith({
    OrganizerItems<TaskDto>? originalTaskItems,
    OrganizerItems<TaskDto>? displayedTaskItems,
    String? criteria,
    TaskStatus? status,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return FilterTasksParams(
      originalTaskItems: originalTaskItems ?? this.originalTaskItems,
      displayedTaskItems: displayedTaskItems ?? this.displayedTaskItems,
      criteria: criteria ?? this.criteria,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props =>
      [originalTaskItems, displayedTaskItems, criteria, status, startDate, endDate];
}

class SortTasksParams {
  final OrganizerItems<TaskDto> tasks;
  final String criteria;

  SortTasksParams({required this.tasks, required this.criteria});

  SortTasksParams copyWith({
    OrganizerItems<TaskDto>? tasks,
    String? criteria,
  }) {
    return SortTasksParams(
      tasks: tasks ?? this.tasks,
      criteria: criteria ?? this.criteria,
    );
  }

  List<Object> get props => [tasks, criteria];
}
