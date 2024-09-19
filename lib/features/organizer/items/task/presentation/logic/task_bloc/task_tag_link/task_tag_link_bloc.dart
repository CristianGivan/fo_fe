part of '../task_bloc.dart';

class TaskTagLinkBloc extends Bloc<TaskTagLinkBlocEvent, TaskTagLinkBlocState> {
  final GetTagsByTaskId getTagsByTaskId;
  final AddTagItemsToTask addTagItemsToTask;
  final AddTagToTask addTagToTask;
  final DeleteTagFromTask deleteTagFromTask;

  TaskTagLinkBloc({
    required this.getTagsByTaskId,
    required this.addTagToTask,
    required this.deleteTagFromTask,
    required this.addTagItemsToTask,
  }) : super(TagLoadingBlocState());

  @override
  Stream<TaskTagLinkBlocState> mapEventToState(
      TaskTagLinkBlocEvent event) async* {
    if (event is GetTagsByTaskIdBlocEvent) {
      yield TagLoadingBlocState();
      final failureOrTags =
          await getTagsByTaskId(GetTagsByTaskIdParams(taskId: event.taskId));
      yield failureOrTags.fold(
        (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
        (tags) => TagLoadedBlocState(tags),
      );
    } else if (event is AddTagToTaskBlocEvent) {
      final failureOrSuccess = await addTagToTask(
          AddTagToTaskParams(taskId: event.taskId, tagId: event.tag.id));
      yield failureOrSuccess.fold(
        (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TagAddedToTaskBlocState(),
      );
    } else if (event is DeleteTagFromTaskBlocEvent) {
      final failureOrSuccess = await deleteTagFromTask(
          DeleteTagFromTaskParams(taskId: event.taskId, tagId: event.tagId));
      yield failureOrSuccess.fold(
        (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
        (_) => TagDeletedFromTaskBlocState(),
      );
    } else if (event is AddTagItemsToTaskBlocEvent) {
      // Handle adding multiple tags to a task
      final failureOrOrganizerItems = await addTagItemsToTask(
        AddTagItemsToTaskParams(taskId: event.taskId, tags: event.tags),
      );
      yield failureOrOrganizerItems.fold(
        (failure) => TagErrorBlocState(_mapFailureToMessage(failure)),
        (organizerItems) => TagItemsAddedToTaskBlocState(organizerItems),
      );
    }
  }
}
