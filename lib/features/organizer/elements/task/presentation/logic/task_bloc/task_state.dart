part of '../../../task_lib.dart';

enum TaskBlocStatus { initial, loading, success, error }

final class TaskState extends Equatable {
  const TaskState({
    this.status = TaskBlocStatus.initial,
    this.taskList = const <TaskEntity>[],
  });

  final TaskBlocStatus status;
  final List<TaskEntity> taskList;

  TaskState copyWith({
    TaskBlocStatus? status,
    List<TaskEntity>? taskList,
  }) {
    return TaskState(
      status: status ?? this.status,
      taskList: taskList ?? this.taskList,
    );
  }

  @override
  String toString() {
    return '''Task List { status: $status, task list length: ${taskList.length} }''';
  }

  @override
  List<Object> get props => [status, taskList];
}
