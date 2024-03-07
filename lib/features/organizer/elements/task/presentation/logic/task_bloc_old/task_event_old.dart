// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../../task_lib.dart';

sealed class TaskEventOld extends Equatable {
  const TaskEventOld();

  @override
  List<Object?> get props => [];
}

// todo get last task viewed before closed
class TaskInitialized extends TaskEventOld {}

class GetTaskByIdBloc extends TaskEventOld {
  final int id;

  const GetTaskByIdBloc({
    required this.id,
  });
}

//-----
class GetAllTask extends TaskEventOld {}
// todo get all task
// class GetAllTask extends TaskEvent {}

class GetTaskListByTasksId extends TaskEventOld {
  final int tasksId;

  const GetTaskListByTasksId(
    this.tasksId,
  );

  @override
  List<Object?> get props => [tasksId];
}

class TaskAdded extends TaskEventOld {
  final TaskEntity task;

  const TaskAdded(this.task);

  @override
  List<Object?> get props => [task];
}

class RemoveTask extends TaskEventOld {
  final TaskEntity task;

  const RemoveTask(this.task);

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEventOld {
  final int index;

  const UpdateTask(this.index);

  @override
  List<Object?> get props => [index];
}
