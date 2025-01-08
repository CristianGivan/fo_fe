part of '../task_bloc.dart';

class TaskUserLinkBloc extends OrganizerLinkBloc {
  final GetLinkItemsByItemIdUseCase getUserItemsByTaskIdUseCase;
  final UpdateItemsOfItemUseCase<UserEntity> updateLinkItemsOfItemUseCase;

  TaskUserLinkBloc({
    required this.getUserItemsByTaskIdUseCase,
    required this.updateLinkItemsOfItemUseCase,
  }) : super(
          getItemsLinked: getUserItemsByTaskIdUseCase,
        ) {
    setupEventHandlers();
    on<UpdateItemsOfItemBlocEvent>(_onUpdateLinkItemsOfItem);
  }

  Future<void> _onUpdateLinkItemsOfItem(
      UpdateItemsOfItemBlocEvent event, Emitter<OrganizerBlocState> emit) async {
    await handleEvent(
      emit: emit,
      action: () => updateLinkItemsOfItemUseCase(event.params),
      originalItems: (items) => items,
      displayedItems: (items) => items,
    );
  }
}
