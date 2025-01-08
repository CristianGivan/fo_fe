part of '../task_bloc.dart';

class TaskUserLinkBloc extends OrganizerLinkBloc {
  final GetLinkItemsByItemIdUseCase getUserItemsByTaskIdUseCase;
  final UpdateLinkItemsOfItemUseCase<UserEntity> updateLinkItemsOfItemUseCase;

  TaskUserLinkBloc({
    required this.getUserItemsByTaskIdUseCase,
    required this.updateLinkItemsOfItemUseCase,
  }) : super(
          getItemsLinked: getUserItemsByTaskIdUseCase,
        ) {
    setupEventHandlers();
    on<UpdateLinkItemsOfItemBlocEvent>(_onUpdateLinkItemsOfItem);
  }

  Future<void> _onUpdateLinkItemsOfItem(
      UpdateLinkItemsOfItemBlocEvent event, Emitter<OrganizerBlocState> emit) async {
    await handleEvent(
      emit: emit,
      action: () => updateLinkItemsOfItemUseCase(event.params),
      originalItems: (items) => items,
      displayedItems: (items) => items,
    );
  }
}
