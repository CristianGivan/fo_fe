part of 'task_bloc.dart';

abstract class TaskBlocTagEvent extends Equatable {
  const TaskBlocTagEvent();

  @override
  List<Object> get props => [];
}

class GetTagsByTaskIdBlocEvent extends TaskBlocTagEvent {
  final int taskId;

  GetTagsByTaskIdBlocEvent(this.taskId);

  @override
  List<Object> get props => [taskId];
}

class AddTagToTaskBlocEvent extends TaskBlocTagEvent {
  final int taskId;
  final TagEntity tag;

  AddTagToTaskBlocEvent(this.taskId, this.tag);

  @override
  List<Object> get props => [taskId, tag];
}

class DeleteTagFromTaskBlocEvent extends TaskBlocTagEvent {
  final int taskId;
  final int tagId;

  DeleteTagFromTaskBlocEvent(this.taskId, this.tagId);

  @override
  List<Object> get props => [taskId, tagId];
}
