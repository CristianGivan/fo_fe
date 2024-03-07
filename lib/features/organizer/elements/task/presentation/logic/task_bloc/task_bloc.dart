part of '../../../task_lib.dart';

class TaskBloc extends Bloc<TaskEvent, TaskBlocState> {
  final GetTaskById getTaskById;
  final InputConverter inputConverter;

  TaskBloc({
    required this.getTaskById,
    required this.inputConverter,
  }) : super(TaskInitialState()) {
    on<TaskEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
