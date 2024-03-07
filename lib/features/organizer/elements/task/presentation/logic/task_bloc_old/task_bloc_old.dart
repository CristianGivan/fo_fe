part of '../../../task_lib.dart';

class TaskBlocOld extends Bloc<TaskEventOld, TaskState> {
  TaskBlocOld() : super(const TaskState()) {
    on<TaskEventOld>((event, emit) {
      // TODO: implement event handler
    });
    on<TaskInitialized>(_onStarted);
    on<TaskAdded>(_onTaskAdded);
    on<GetAllTask>(_onGetAllTask);
    on<GetTaskListByTasksId>(_onGetTaskListByTasksId);
  }

  Future<void> _onGetAllTask(GetAllTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskBlocStatusOld.loading));
    try {
      emit(state.copyWith(
          taskList: await database.getAllTask(),
          status: TaskBlocStatusOld.success));
    } catch (e) {
      emit(state.copyWith(status: TaskBlocStatusOld.error));
    }
  }

  void _onStarted(TaskInitialized event, Emitter<TaskState> emit) {
    if (state.status == TaskBlocStatusOld.success) return;
    emit(state.copyWith(status: TaskBlocStatusOld.success));
  }

  void _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) {
    emit(state.copyWith(status: TaskBlocStatusOld.loading));
    try {
      List<TaskEntity> temp = [];
      temp.insert(0, event.task);
      emit(state.copyWith(taskList: temp, status: TaskBlocStatusOld.success));
    } catch (e) {
      emit(state.copyWith(status: TaskBlocStatusOld.error));
    }
  }

  Future<void> _onGetTaskListByTasksId(
      GetTaskListByTasksId event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskBlocStatusOld.loading));
    try {
      emit(state.copyWith(
          taskList: await database.getTaskListByTasksId(event.tasksId),
          status: TaskBlocStatusOld.success));
    } catch (e) {
      emit(state.copyWith(status: TaskBlocStatusOld.error));
    }
  }
}
