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
    on<GetTaskByIdBlocEvent>(_onGetTaskByIdBlocEvent);
    on<LoadTaskItemsAllBlocEvent>(_onLoadTaskItemsAllBlocEvent);
    on<LoadTaskItemsByIdSetBlocEvent>(_onLoadTaskItemsByIdSetBlocEvent);
    on<AddTaskBlocEvent>(_onAddTaskBlocEvent);
    on<UpdateTaskBlocEvent>(_onUpdateTaskBlocEvent);
    on<DeleteTaskBlocEvent>(_onDeleteTaskBlocEvent);
  }

  void _onGetTaskByIdBlocEvent(
    GetTaskByIdBlocEvent event,
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
    LoadTaskItemsAllBlocEvent event,
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
    LoadTaskItemsByIdSetBlocEvent event,
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
    AddTaskBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess =
        await insertTask(InsertTaskParams(task: event.task));
    emit(failureOrSuccess.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (success) => TaskAddedBlocState(),
    ));
    add(LoadTaskItemsAllBlocEvent()); // Refresh the task list
  }

  void _onUpdateTaskBlocEvent(
    UpdateTaskBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess =
        await updateTask(UpdateTaskParams(task: event.task));
    emit(failureOrSuccess.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (success) => TaskUpdatedBlocState(),
    ));
    add(LoadTaskItemsAllBlocEvent()); // Refresh the task list
  }

  void _onDeleteTaskBlocEvent(
    DeleteTaskBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    emit(TaskLoadingBlocState());
    final failureOrSuccess =
        await deleteTask(DeleteTaskParams(taskId: event.taskId));
    emit(failureOrSuccess.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (success) => TaskDeletedBlocState(),
    ));
    add(LoadTaskItemsAllBlocEvent()); // Refresh the task list
  }
}
