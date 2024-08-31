part of 'task_bloc.dart';

class TaskBlocTask extends Bloc<TaskBlocTaskEvent, TaskBlocState> {
  final GetTaskById getTaskById;
  final GetTaskItemsAll getTaskItemsAll;
  final GetTaskItemsByIdSet getTaskItemsByIdSet;
  final InsertTask insertTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  TaskBlocTask({
    required this.getTaskById,
    required this.getTaskItemsAll,
    required this.getTaskItemsByIdSet,
    required this.insertTask,
    required this.updateTask,
    required this.deleteTask,
  }) : super(TaskInitialBlocState()) {
    on<TaskGetByIdBlocEvent>(_onGetTaskByIdBlocEvent);
    on<TaskGetItemsAllBlocEvent>(_onLoadTaskItemsAllBlocEvent);
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
      (task) => TaskLoadedBlocState(OrganizerItems.of([task])),
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
      (tasks) => TaskLoadedBlocState(tasks),
    ));
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
      (tasks) => TaskLoadedBlocState(tasks),
    ));
  }

  void _onAddTaskBlocEvent(
    TaskAddBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess =
        await insertTask(InsertTaskParams(task: event.task));
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
