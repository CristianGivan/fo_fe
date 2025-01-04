part of '../task_bloc.dart';

class TaskUserLinkBloc extends OrganizerLinkBloc<UserEntity> {
  final GetLinkItemsByItemIdUseCase<UserEntity> getUserItemsByTaskIdUseCase;

  TaskUserLinkBloc({
    required this.getUserItemsByTaskIdUseCase,
  }) : super(getItemsLinked: getUserItemsByTaskIdUseCase) {
    setupEventHandlers();
  }
}
