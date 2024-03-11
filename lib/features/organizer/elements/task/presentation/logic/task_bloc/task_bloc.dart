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
      final idEathre =
          inputConverter.stringToUnasingInteger(event.numberString);
      idEathre.fold(
          (failure) => emit(const TaskErrorState(invalidInputFailureMessage)),
          (id) async {
        final taskEntityEither = (await getTaskById(Params(id: id)));
        taskEntityEither.fold(
          (failure) => UnimplementedError(),
          (taskEntity) => UnimplementedError(),
        );
      });
    });
  }
}
