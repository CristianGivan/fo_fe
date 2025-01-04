part of '../task_bloc.dart';

class TaskUserLinkBloc extends OrganizerLinkBloc<ItemEntity> {
  final GetLinkItemsByItemIdUseCase getUserItemsByTaskIdUseCase;

  TaskUserLinkBloc({
    required this.getUserItemsByTaskIdUseCase,
  }) : super(getItemsLinked: getUserItemsByTaskIdUseCase) {
    setupEventHandlers();
  }
}
