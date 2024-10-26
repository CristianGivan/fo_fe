part of '../task_bloc.dart';

abstract class TaskTagLinkBlocState extends Equatable {
  const TaskTagLinkBlocState();

  @override
  List<Object> get props => [];
}

class TaskTagLoadingBlocState extends TaskTagLinkBlocState {}

class TaskTagLoadedBlocState extends TaskTagLinkBlocState {
  final OrganizerItems<TagEntity> tagItems;

  TaskTagLoadedBlocState(this.tagItems);

  @override
  List<Object> get props => [tagItems];
}

class TagAddedToTaskBlocState extends TaskTagLinkBlocState {}

class TagItemsAddedToTaskBlocState extends TaskTagLinkBlocState {
  final OrganizerItems<TagEntity> tagItems;

  TagItemsAddedToTaskBlocState(this.tagItems);

  @override
  List<Object> get props => [tagItems];
}

class TagDeletedFromTaskBlocState extends TaskTagLinkBlocState {}

class TaskTagErrorBlocState extends TaskTagLinkBlocState {
  final String message;

  TaskTagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
