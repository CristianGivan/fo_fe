part of 'task_bloc.dart';

abstract class TaskBlocTagState extends Equatable {
  const TaskBlocTagState();

  @override
  List<Object> get props => [];
}

class TagLoadingBlocState extends TaskBlocTagState {}

class TagLoadedBlocState extends TaskBlocTagState {
  final List<TagEntity> tags;

  TagLoadedBlocState(this.tags);

  @override
  List<Object> get props => [tags];
}

class TagAddedToTaskBlocState extends TaskBlocTagState {}

class TagDeletedFromTaskBlocState extends TaskBlocTagState {}

class TagErrorBlocState extends TaskBlocTagState {
  final String message;

  TagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
