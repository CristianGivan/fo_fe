part of '../../../task_lib.dart';

class TaskBloc extends Bloc<TaskBlocEvent, TaskBlocState> {
  final LoadTaskItemsAll loadTaskItemsAll;
  final LoadTaskItemsByIdSet loadTaskItemsByIdSet;
  final AddTask addTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;
  final AddUserToTask addUserToTask;
  final AddTagToTask addTagToTask;
  final AddReminderToTask addReminderToTask;

  TaskBloc({
    required this.loadTaskItemsAll,
    required this.loadTaskItemsByIdSet,
    required this.addTask,
    required this.updateTask,
    required this.deleteTask,
    required this.addUserToTask,
    required this.addTagToTask,
    required this.addReminderToTask,
  }) : super(TaskInitialBlocState());

  @override
  Stream<TaskBlocState> mapEventToState(TaskBlocEvent event) async* {
    if (event is LoadTaskItemsAllBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrTasks = await loadTaskItemsAll(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrTasks);
    } else if (event is LoadTaskItemsByIdSetBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrTasks =
          await loadTaskItemsByIdSet(Params(idSet: event.idSet));
      yield* _eitherLoadedOrErrorState(failureOrTasks);
    } else if (event is AddTaskBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrSuccess = await addTask(event.task);
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TaskAddedBlocState(),
      );
      // } else if (event is UpdateTaskBlocEvent) {
      //   yield TaskLoadingBlocState();
      //   final failureOrSuccess = await updateTask(event.task);
      //   yield failureOrSuccess.fold(
      //     (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
      //     (_) => TaskUpdatedBlocState(),
      //   );
    } else if (event is DeleteTaskBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrSuccess = await deleteTask(event.taskId);
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TaskDeletedBlocState(),
      );
    } else if (event is AddUserToTaskBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrSuccess = await addUserToTask(event.taskId, event.user);
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => UserAddedToTaskBlocState(),
      );
    } else if (event is AddTagToTaskBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrSuccess = await addTagToTask(event.taskId, event.tag);
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TagAddedToTaskBlocState(),
      );
    } else if (event is AddReminderToTaskBlocEvent) {
      yield TaskLoadingBlocState();
      final failureOrSuccess =
          await addReminderToTask(event.taskId, event.reminder);
      yield failureOrSuccess.fold(
        (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
        (_) => ReminderAddedToTaskBlocState(),
      );
    }
  }

  Stream<TaskBlocState> _eitherLoadedOrErrorState(
    Either<Failure, OrganizerItems<TaskEntity>> either,
  ) async* {
    yield either.fold(
      (failure) => TaskErrorBlocState(_mapFailureToMessage(failure)),
      (tasks) => TaskLoadedBlocState(tasks),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}

//
// class TaskBloc extends Bloc<TaskEvent, TaskBlocState> {
//   final GetTaskById getTaskById;
//   final InputConverter inputConverter;
//
//   TaskBloc({
//     required this.getTaskById,
//     required this.inputConverter,
//   }) : super(TaskInitialState()) {
//     on<GetTaskByIdEvent>((event, emit) async {
//       emit(TaskLoadingState());
//       final idEither =
//           inputConverter.stringToUnasingInteger(event.numberString);
//       idEither.fold(
//         (failure) => emit(const TaskErrorState(invalidInputFailureMessage)),
//         (id) => _fetchTask(id, emit),
//       );
//     });
//   }
//
//   void _fetchTask(int id, Emitter<TaskBlocState> emit) async {
//     final taskEntityEither = await getTaskById(Params.withSingleId(id));
//
//     taskEntityEither.fold(
//       (failure) => emit(TaskErrorState(getFailureMessage(failure))),
//       (taskEntity) => emit(TaskLoadedState(taskEntity)),
//     );
//   }
// }
