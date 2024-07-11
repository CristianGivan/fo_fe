part of 'task_bloc.dart';

abstract class TaskTagBlocState extends Equatable {
  const TaskTagBlocState();

  @override
  List<Object> get props => [];
}

class TagLoadingBlocState extends TaskTagBlocState {}

class TagLoadedBlocState extends TaskTagBlocState {
  final List<TagEntity> tags;

  TagLoadedBlocState(this.tags);

  @override
  List<Object> get props => [tags];
}

class TagAddedToTaskBlocState extends TaskTagBlocState {}

class TagDeletedFromTaskBlocState extends TaskTagBlocState {}

class TagErrorBlocState extends TaskTagBlocState {
  final String message;

  TagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
