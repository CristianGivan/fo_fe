part of 'task_bloc.dart';

class TaskBlocTag extends Bloc<TaskBlocTagEvent, TaskBlocTagState> {
  final GetTagsByTaskId getTagsByTaskId;
  final AddTagToTask addTagToTask;
  final DeleteTagFromTask deleteTagFromTask;

  TaskBlocTag({
    required this.getTagsByTaskId,
    required this.addTagToTask,
    required this.deleteTagFromTask,
  }) : super(TagLoadingBlocState());

  @override
  Stream<TaskBlocTagState> mapEventToState(TaskBlocTagEvent event) async* {
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
    }
  }
}
