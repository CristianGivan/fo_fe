part of '../../../tasks.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<TasksEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TasksInitialized>(_onStarted);
    on<TasksAdded>(_onTasksAdded);
    on<GetAllTasks>(_onGetAllTasks);
  }

  Future<void> _onGetAllTasks(
      GetAllTasks event, Emitter<TasksState> emit) async {
    emit(state.copyWith(status: TasksStatus.loading));
    try {
      emit(state.copyWith(
          tasksList: await database.getAllTasks(),
          status: TasksStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TasksStatus.error));
    }
  }

  void _onStarted(TasksInitialized event, Emitter<TasksState> emit) {
    if (state.status == TasksStatus.success) return;
    emit(state.copyWith(
        tasksList: state.tasksList, status: TasksStatus.success));
  }

  void _onTasksAdded(TasksAdded event, Emitter<TasksState> emit) {
    emit(state.copyWith(status: TasksStatus.loading));
    try {
      List<Tasks> temp = [];
      temp.addAll(state.tasksList);
      temp.insert(0, event.tasks);
      emit(state.copyWith(tasksList: temp, status: TasksStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TasksStatus.error));
    }
  }
}
