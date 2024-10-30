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

class TagItemsUpdatedToTaskBlocState extends TaskTagLinkBlocState {
  final OrganizerItems<TagEntity> tagItemsUpdated;

  TagItemsUpdatedToTaskBlocState(this.tagItemsUpdated);

  @override
  List<Object> get props => [tagItemsUpdated];
}

class TaskTagErrorBlocState extends TaskTagLinkBlocState {
  final String message;

  TaskTagErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}
