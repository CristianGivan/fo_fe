part of '../task_bloc.dart';

class TaskTagLinkBloc extends Bloc<TaskTagLinkBlocEvent, TaskTagLinkBlocState> {
  final GetTagItemsByTaskId getTagsByTaskId;
  final AddTagItemsToTaskUseCase addReminderItemsToTask;
  final UpdateTagItemsOfTask updateTagItemsOfTask;
  final DeleteTagFromTask deleteTagFromTask;

  TaskTagLinkBloc({
    required this.getTagsByTaskId,
    required this.deleteTagFromTask,
    required this.addReminderItemsToTask,
    required this.updateTagItemsOfTask,
  }) : super(TaskTagLoadingBlocState()) {
    on<GetTagItemsByTaskIdBlocEvent>(_onGetTagsByTaskId);
    on<DeleteTagFromTaskBlocEvent>(_onDeleteTagFromTask);
    on<AddTagItemsToTaskBlocEvent>(_onAddTagItemsToTask);
    on<UpdateTagItemsOfTaskBlocEvent>(_onUpdateTagItemsOfTask);
  }

  Future<void> _onGetTagsByTaskId(
    GetTagItemsByTaskIdBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TaskTagLoadingBlocState());
    final failureOrTags = await getTagsByTaskId(GetTagsByTaskIdParams(taskId: event.taskId));
    emit(failureOrTags.fold(
      (failure) => TaskTagErrorBlocState(_mapFailureToMessage(failure)),
      (tags) => TaskTagLoadedBlocState(tags),
    ));
  }

  Future<void> _onDeleteTagFromTask(
    DeleteTagFromTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    final failureOrSuccess =
        await deleteTagFromTask(DeleteTagFromTaskParams(taskId: event.taskId, tagId: event.tagId));
    emit(failureOrSuccess.fold(
      (failure) => TaskTagErrorBlocState(_mapFailureToMessage(failure)),
      (_) => TagDeletedFromTaskBlocState(),
    ));
  }

  Future<void> _onAddTagItemsToTask(
    AddTagItemsToTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TaskTagLoadingBlocState());
    final failureOrOrganizerItems = await addReminderItemsToTask(AddItemsToTaskParams(
      taskId: event.taskId,
      itemsIds: event.tagIds,
    ));
    emit(failureOrOrganizerItems.fold(
      (failure) => TaskTagErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => TagItemsAddedToTaskBlocState(organizerItems),
    ));
  }

  Future<void> _onUpdateTagItemsOfTask(
    UpdateTagItemsOfTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TaskTagLoadingBlocState());
    final failureOrOrganizerItems = await updateTagItemsOfTask(UpdateItemsToTaskParams(
      taskId: event.taskId,
      items: event.tagItems,
      updatedItems: event.updatedTagItems,
    ));
    emit(failureOrOrganizerItems.fold(
      (failure) => TaskTagErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => TagItemsAddedToTaskBlocState(organizerItems),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return 'Network error: ${failure.message}';
    } else if (failure is ServerFailure) {
      return 'Server error: ${failure.message}';
    } else {
      return 'An error occurred: ${failure.message}';
    }
  }
}
