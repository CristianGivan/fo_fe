part of '../task_bloc.dart';

class TaskUserLinkBlocState extends OrganizerBlocState<UserEntity> {
  final String? errorMessage;

  TaskUserLinkBlocState({
    required super.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        status,
        errorMessage,
      ];
}
