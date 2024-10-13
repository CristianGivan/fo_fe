part of '../task_bloc.dart';

class TaskTagLinkBloc extends Bloc<TaskTagLinkBlocEvent, TaskTagLinkBlocState> {
  final GetTagsByTaskId getTagsByTaskId;
  final AddTagToTask addTagToTask;
  final AddTagItemsToTask addTagItemsToTask;
  final UpdateTagItemsOfTask updateTagItemsOfTask;
  final DeleteTagFromTask deleteTagFromTask;

  TaskTagLinkBloc({
    required this.getTagsByTaskId,
    required this.addTagToTask,
    required this.deleteTagFromTask,
    required this.addTagItemsToTask,
    required this.updateTagItemsOfTask,
  }) : super(TagLoadingBlocState()) {
    on<GetTagsByTaskIdBlocEvent>(_onGetTagsByTaskId);
    on<AddTagToTaskBlocEvent>(_onAddTagToTask);
    on<DeleteTagFromTaskBlocEvent>(_onDeleteTagFromTask);
    on<AddTagItemsToTaskBlocEvent>(_onAddTagItemsToTask);
    on<UpdateTagItemsOfTaskBlocEvent>(_onUpdateTagItemsOfTask);
  }

  Future<void> _onGetTagsByTaskId(
    GetTagsByTaskIdBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TagLoadingBlocState());
    final failureOrTags =
        await getTagsByTaskId(GetTagsByTaskIdParams(taskId: event.taskId));
    emit(failureOrTags.fold(
      (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
      (tags) => TagLoadedBlocState(tags),
    ));
  }

  Future<void> _onAddTagToTask(
    AddTagToTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    final failureOrSuccess = await addTagToTask(
        AddTagToTaskParams(taskId: event.taskId, tagId: event.tag.id));
    emit(failureOrSuccess.fold(
      (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
      (_) => TagAddedToTaskBlocState(),
    ));
  }

  Future<void> _onDeleteTagFromTask(
    DeleteTagFromTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    final failureOrSuccess = await deleteTagFromTask(
        DeleteTagFromTaskParams(taskId: event.taskId, tagId: event.tagId));
    emit(failureOrSuccess.fold(
      (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
      (_) => TagDeletedFromTaskBlocState(),
    ));
  }

  Future<void> _onAddTagItemsToTask(
    AddTagItemsToTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TagLoadingBlocState());
    final failureOrOrganizerItems = await addTagItemsToTask(
        AddTagItemsToTaskParams(taskId: event.taskId, tagIds: event.tagIds));
    emit(failureOrOrganizerItems.fold(
      (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => TagItemsAddedToTaskBlocState(organizerItems),
    ));
  }

  Future<void> _onUpdateTagItemsOfTask(
    UpdateTagItemsOfTaskBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TagLoadingBlocState());
    final failureOrOrganizerItems = await updateTagItemsOfTask(
        UpdateTagItemsToTaskParams(
            taskId: event.taskId,
            tagItems: event.tagItems,
            updatedTagItems: event.updatedTagItems));
    emit(failureOrOrganizerItems.fold(
      (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => TagItemsAddedToTaskBlocState(organizerItems),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    // Map the failure to a user-friendly message
    return 'An error occurred';
  }
}
