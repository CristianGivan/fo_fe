part of '../../../tag_lib.dart';

sealed class TagBlocEvent extends Equatable {
  const TagBlocEvent();

  @override
  List<Object?> get props => [];
}

// todo get last tag viewed before closed
class TagInitialized extends TagBlocEvent {}

class GetAllTag extends TagBlocEvent {}
// todo get all tag
// class GetAllTag extends TagBlocEvent {}

class GetTagListByTaskId extends TagBlocEvent {
  final int taskId;

  const GetTagListByTaskId(
    this.taskId,
  );

  @override
  List<Object?> get props => [taskId];
}

class TagAdded extends TagBlocEvent {
  final Tag tag;

  const TagAdded(this.tag);

  @override
  List<Object?> get props => [tag];
}

class RemoveTag extends TagBlocEvent {
  final Tag tag;

  const RemoveTag(this.tag);

  @override
  List<Object?> get props => [tag];
}

class UpdateTag extends TagBlocEvent {
  final int index;

  const UpdateTag(this.index);

  @override
  List<Object?> get props => [index];
}
