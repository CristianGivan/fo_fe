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
  }) : super(TaskInitialBlocState());

  @override
  Stream<TaskBlocState> mapEventToState(TaskBlocTaskEvent event) async* {
    if (event is LoadTaskItemsAllBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrTasks = await getTaskItemsAll(NoParams());
      yield failureOrTasks.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (tasks) => TaskLoadedBlocState(tasks),
      );
    } else if (event is LoadTaskItemsByIdSetBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrTasks = await getTaskItemsByIdSet(
          GetTaskItemsByIdSetParams(idSet: event.idSet));
      yield failureOrTasks.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (tasks) => TaskLoadedBlocState(tasks),
      );
    } else if (event is AddTaskBlocEvent) {
      final failureOrSuccess =
          await insertTask(InsertTaskParams(task: event.task));
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TaskAddedBlocState(),
      );
    } else if (event is UpdateTaskBlocEvent) {
      final failureOrSuccess =
          await updateTask(UpdateTaskParams(task: event.task));
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TaskUpdatedBlocState(),
      );
    } else if (event is DeleteTaskBlocEvent) {
      final failureOrSuccess =
          await deleteTask(DeleteTaskParams(taskId: event.taskId));
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TaskDeletedBlocState(),
      );
    }
  }
}
