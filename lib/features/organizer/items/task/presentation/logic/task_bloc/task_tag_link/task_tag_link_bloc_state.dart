part of '../task_bloc.dart';

abstract class TaskTagLinkBlocState extends Equatable {
  const TaskTagLinkBlocState();

  @override
  List<Object> get props => [];
}

class TagLoadingBlocState extends TaskTagLinkBlocState {}

class TagLoadedBlocState extends TaskTagLinkBlocState {
  final OrganizerItems<TagEntity> tagItems;

  TagLoadedBlocState(this.tagItems);

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

class TagErrorBlocState extends TaskTagLinkBlocState {
  final String message;

  TagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
