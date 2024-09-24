part of 'task_bloc.dart';

class TaskBlocTask extends Bloc<TaskBlocTaskEvent, TaskBlocState> {
  final GetTaskById getTaskById;
  final GetTaskItemsAll getTaskItemsAll;
  final GetTaskItemsByIdSet getTaskItemsByIdSet;
  final AddTask addTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;
  final TaskSortUseCase sortTasksUseCase;
  final TaskFilterUseCase filterTasksUseCase;

  TaskBlocTask({
    required this.getTaskById,
    required this.getTaskItemsAll,
    required this.getTaskItemsByIdSet,
    required this.addTask,
    required this.updateTask,
    required this.deleteTask,
    required this.sortTasksUseCase,
    required this.filterTasksUseCase,
  }) : super(TaskInitialBlocState()) {
    on<TaskGetByIdBlocEvent>(_onGetTaskByIdBlocEvent);
    on<TaskGetItemsAllBlocEvent>(_onLoadTaskItemsAllBlocEvent);
    on<TaskItemsSortBlocEvent>(_onTaskItemsSortBlocEvent);
    on<TaskItemsFilterBlocEvent>(_onTaskItemsFilterBlocEvent);
    on<TaskLoadItemsByIdSetBlocEvent>(_onLoadTaskItemsByIdSetBlocEvent);
    on<TaskAddBlocEvent>(_onAddTaskBlocEvent);
    on<TaskUpdateBlocEvent>(_onUpdateTaskBlocEvent);
    on<TaskDeleteBlocEvent>(_onDeleteTaskBlocEvent);
  }

  void _onGetTaskByIdBlocEvent(
    TaskGetByIdBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrTask =
        await getTaskById(GetTaskByIdParams(id: event.taskId));
    emit(failureOrTask.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (task) => TaskLoadedBlocState(
          originalTasks: OrganizerItems.of([task]),
          displayedTasks: OrganizerItems.of([task])),
    ));
  }

  void _onLoadTaskItemsAllBlocEvent(
    TaskGetItemsAllBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrTasks = await getTaskItemsAll(NoParams());
    emit(failureOrTasks.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (tasks) =>
          TaskLoadedBlocState(originalTasks: tasks, displayedTasks: tasks),
    ));
  }

  void _onTaskItemsFilterBlocEvent(
    TaskItemsFilterBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    if (state is TaskLoadedBlocState) {
      final currentState = state as TaskLoadedBlocState;

      final failureOrFilteredTasks =
          await filterTasksUseCase(event.filterParams.copyWith(
        displayedTasks: currentState.displayedTasks,
      ));

      emit(failureOrFilteredTasks.fold(
        (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
        (filteredTasks) => TaskLoadedBlocState(
          originalTasks: currentState.originalTasks,
          displayedTasks: filteredTasks,
        ),
      ));
    }
  }

  void _onTaskItemsSortBlocEvent(
    TaskItemsSortBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    if (state is TaskLoadedBlocState) {
      final currentState = state as TaskLoadedBlocState;
      final originalTasks = currentState.originalTasks;
      final displayedTasks = currentState.displayedTasks;

      final failureOrSortedTasks = await sortTasksUseCase(
          event.sortParams.copyWith(tasks: displayedTasks));

      emit(failureOrSortedTasks.fold(
        (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
        (sortedTasks) => TaskLoadedBlocState(
          originalTasks: originalTasks,
          displayedTasks: sortedTasks,
        ),
      ));
    }
  }

  void _onLoadTaskItemsByIdSetBlocEvent(
    TaskLoadItemsByIdSetBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrTasks = await getTaskItemsByIdSet(
        GetTaskItemsByIdSetParams(idSet: event.idSet));
    emit(failureOrTasks.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (tasks) =>
          TaskLoadedBlocState(originalTasks: tasks, displayedTasks: tasks),
    ));
  }

  void _onAddTaskBlocEvent(
    TaskAddBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess = await addTask(InsertTaskParams(task: event.task));
    emit(failureOrSuccess.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (success) => TaskAddedBlocState(),
    ));
    add(TaskGetItemsAllBlocEvent()); // Refresh the task list
  }

  void _onUpdateTaskBlocEvent(
    TaskUpdateBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess =
        await updateTask(UpdateTaskParams(task: event.task));
    emit(failureOrSuccess.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (success) => TaskUpdatedBlocState(),
    ));
    add(TaskGetItemsAllBlocEvent()); // Refresh the task list
  }

  void _onDeleteTaskBlocEvent(
    TaskDeleteBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess =
        await deleteTask(DeleteTaskParams(taskId: event.taskId));
    emit(failureOrSuccess.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (success) => TaskDeletedBlocState(),
    ));
    add(TaskGetItemsAllBlocEvent()); // Refresh the task list
  }
}
