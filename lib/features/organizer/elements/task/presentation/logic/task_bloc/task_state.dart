part of '../../../task.dart';

enum TaskStatus { initial, loading, success, error }

final class TaskState extends Equatable {
  const TaskState({
    this.status = TaskStatus.initial,
    this.taskList = const <Task>[],
  });

  final TaskStatus status;
  final List<Task> taskList;

  TaskState copyWith({
    TaskStatus? status,
    List<Task>? taskList,
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
