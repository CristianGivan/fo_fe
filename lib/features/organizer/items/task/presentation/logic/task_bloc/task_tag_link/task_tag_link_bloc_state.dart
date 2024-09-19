part of '../task_bloc.dart';

abstract class TaskTagLinkBlocState extends Equatable {
  const TaskTagLinkBlocState();

  @override
  List<Object> get props => [];
}

class TagLoadingBlocState extends TaskTagLinkBlocState {}

class TagLoadedBlocState extends TaskTagLinkBlocState {
  final OrganizerItems<TagEntity> tags;

  TagLoadedBlocState(this.tags);

  @override
  List<Object> get props => [tags];
}

class TagAddedToTaskBlocState extends TaskTagLinkBlocState {}

class TagItemsAddedToTaskBlocState extends TaskTagLinkBlocState {
  final OrganizerItems<TagEntity> organizerItems;

  TagItemsAddedToTaskBlocState(this.organizerItems);

  @override
  List<Object> get props => [organizerItems];
}

class TagDeletedFromTaskBlocState extends TaskTagLinkBlocState {}

class TagErrorBlocState extends TaskTagLinkBlocState {
  final String message;

  TagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
