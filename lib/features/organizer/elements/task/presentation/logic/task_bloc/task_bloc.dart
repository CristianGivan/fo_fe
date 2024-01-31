part of '../../../task_lib.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<TaskEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<TaskInitialized>(_onStarted);
    on<TaskAdded>(_onTaskAdded);
    on<GetAllTask>(_onGetAllTask);
    on<GetTaskListByTasksId>(_onGetTaskListByTasksId);
  }

  Future<void> _onGetAllTask(GetAllTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskBlocStatus.loading));
    try {
      emit(state.copyWith(
          taskList: await database.getAllTask(),
          status: TaskBlocStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskBlocStatus.error));
    }
  }

  void _onStarted(TaskInitialized event, Emitter<TaskState> emit) {
    if (state.status == TaskBlocStatus.success) return;
    emit(state.copyWith(
        taskList: state.taskList, status: TaskBlocStatus.success));
  }

  void _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) {
    emit(state.copyWith(status: TaskBlocStatus.loading));
    try {
      List<Task> temp = [];
      temp.addAll(state.taskList);
      temp.insert(0, event.task);
      emit(state.copyWith(taskList: temp, status: TaskBlocStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskBlocStatus.error));
    }
  }

  Future<void> _onGetTaskListByTasksId(
      GetTaskListByTasksId event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskBlocStatus.loading));
    try {
      emit(state.copyWith(
          taskList: await database.getTaskListByTasksId(event.tasksId),
          status: TaskBlocStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskBlocStatus.error));
    }
  }
}
