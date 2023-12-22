part of 'tasks_bloc.dart';

enum TasksStatus { initial, loading, success, error }

final class TasksState extends Equatable {
  const TasksState({
    this.status = TasksStatus.initial,
    this.tasksList = const <Tasks>[],
  });

  final TasksStatus status;
  final List<Tasks> tasksList;

  TasksState copyWith({
    TasksStatus? status,
    List<Tasks>? tasksList,
  }) {
    return TasksState(
      status: status ?? this.status,
      tasksList: tasksList ?? this.tasksList,
    );
  }

  @override
  String toString() {
    return '''Task List { status: $status, tasks list length: ${tasksList.length} }''';
  }

  @override
  List<Object> get props => [status, tasksList];
}
