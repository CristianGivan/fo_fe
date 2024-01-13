import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/features/tasks/model/task.dart';
import 'package:fo_fe/main.dart';

part 'task_event.dart';
part 'task_state.dart';

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
    emit(state.copyWith(status: TaskStatus.loading));
    try {
      emit(state.copyWith(
          taskList: await database.getAllTask(), status: TaskStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskStatus.error));
    }
  }

  void _onStarted(TaskInitialized event, Emitter<TaskState> emit) {
    if (state.status == TaskStatus.success) return;
    emit(state.copyWith(taskList: state.taskList, status: TaskStatus.success));
  }

  void _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) {
    emit(state.copyWith(status: TaskStatus.loading));
    try {
      List<Task> temp = [];
      temp.addAll(state.taskList);
      temp.insert(0, event.task);
      emit(state.copyWith(taskList: temp, status: TaskStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskStatus.error));
    }
  }

  Future<void> _onGetTaskListByTasksId(
      GetTaskListByTasksId event, Emitter<TaskState> emit) async {
    emit(state.copyWith(status: TaskStatus.loading));
    try {
      // Future<List<Task>> temp1 = database.getTaskListByTasksId(event.tasksId);
      // var a = 3;
      // temp1 = database.getTaskListByTasksId(event.tasksId);
      // var a1 = 3;

      // List<Task> temp = [];
      // temp = temp1 as List<Task>;
      emit(state.copyWith(
          taskList: await database.getTaskListByTasksId(event.tasksId),
          status: TaskStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TaskStatus.error));
    }
  }
}
