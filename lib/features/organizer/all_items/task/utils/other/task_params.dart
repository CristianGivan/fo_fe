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
    OrganizerItems<TaskDto>? taskItems,
  })  : taskEntity = task ?? TaskEntity.empty(),
        taskUserLinkEntity = taskUserLinkEntity ?? TaskUserLinkEntity.empty(),
        taskDto =
            taskDto ?? TaskDto(task: TaskEntity.empty(), taskUserLink: TaskUserLinkEntity.empty()),
        taskItems = taskItems ?? OrganizerItems.empty(),
        super(
          id: id ?? 0,
          forUserId: forUserId ?? 0,
          idSet: idSet ?? IdSet.empty(),
          itemType: ItemsTypeEnum.task,
        );

  TaskParams copyWith({
    TaskEntity? task,
    TaskUserLinkEntity? taskUserLinkEntity,
    TaskDto? taskDto,
    int? id,
    IdSet? idSet,
    int? forUserId,
  }) {
    return TaskParams(
      task: task ?? this.taskEntity,
      taskUserLinkEntity: taskUserLinkEntity ?? this.taskUserLinkEntity,
      taskDto: taskDto ?? this.taskDto,
      id: id ?? this.id,
      idSet: idSet ?? this.idSet,
      forUserId: forUserId ?? this.forUserId,
    );
  }

  @override
  List<Object> get props => [taskEntity, taskUserLinkEntity, taskDto, ...super.props];

  get itemReturnType => super.itemType;
}

class UpdateLinkItemsOfItemParams<T extends OrganizerItemEntity> extends ItemParams {
  final int itemId;
  final ItemsTypeEnum itemType;
  final OrganizerItems<T> items;
  final OrganizerItems<T> updatedItems;
  final OrganizerItems<T> addedItems;
  final OrganizerItems<T> removedItems;

  UpdateLinkItemsOfItemParams({
    required this.itemId,
    required this.itemType,
    OrganizerItems<T>? items,
    OrganizerItems<T>? updatedItems,
    OrganizerItems<T>? addedItems,
    OrganizerItems<T>? removedItems,
  })  : items = items ?? OrganizerItems.empty(),
        updatedItems = updatedItems ?? OrganizerItems.empty(),
        addedItems = addedItems ?? OrganizerItems.empty(),
        removedItems = removedItems ?? OrganizerItems.empty();

  @override
  List<Object> get props => [itemId, items, updatedItems, addedItems, removedItems];
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
