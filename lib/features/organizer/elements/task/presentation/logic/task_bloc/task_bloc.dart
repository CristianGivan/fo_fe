part of '../../../task_lib.dart';

class TaskBloc extends Bloc<TaskEvent, TaskBlocState> {
  final GetTaskById getTaskById;
  final InputConverter inputConverter;

  TaskBloc({
    required this.getTaskById,
    required this.inputConverter,
  }) : super(TaskInitialState()) {
    on<GetTaskByIdEvent>((event, emit) async {
      emit(TaskLoadingState());
      final idEither =
          inputConverter.stringToUnasingInteger(event.numberString);
      idEither.fold(
        (failure) => emit(const TaskErrorState(invalidInputFailureMessage)),
        (id) => _fetchTask(id, emit),
      );
    });
  }

  void _fetchTask(int id, Emitter<TaskBlocState> emit) async {
    final taskEntityEither = await getTaskById(Params(id: id));

    taskEntityEither.fold(
      (failure) => emit(TaskErrorState(_getFailureMessage(failure))),
      (taskEntity) => emit(TaskLoadedState(taskEntity)),
    );
  }

  String _getFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return localFailureMessage;
    }
  }
}
