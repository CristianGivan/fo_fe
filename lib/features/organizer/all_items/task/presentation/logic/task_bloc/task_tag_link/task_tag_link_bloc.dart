part of '../task_bloc.dart';

class TaskTagLinkBloc extends Bloc<TaskTagLinkBlocEvent, TaskTagLinkBlocState> {
  final GetTagItemsByTaskIdUseCase getTagsByTaskId;
  final UpdateTagItemsOfTaskUseCase updateTagItemsOfTask;

  TaskTagLinkBloc({
    required this.getTagsByTaskId,
    required this.updateTagItemsOfTask,
  }) : super(TaskTagLoadingBlocState()) {
    on<GetTagItemsByTaskIdBlocEvent>(_onGetTagsByTaskId);
    on<UpdateTagItemsOfTaskBlocEvent>(_onUpdateTagItemsOfTask);
  }

  Future<void> _onGetTagsByTaskId(
    GetTagItemsByTaskIdBlocEvent event,
    Emitter<TaskTagLinkBlocState> emit,
  ) async {
    emit(TaskTagLoadingBlocState());
    final failureOrTags = await getTagsByTaskId(TaskParams(id: event.taskId));
    emit(failureOrTags.fold(
      (failure) => TaskTagErrorBlocState(_mapFailureToMessage(failure)),
      (tags) => TaskTagLoadedBlocState(tags),
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
      (organizerItems) => TagItemsUpdatedToTaskBlocState(organizerItems),
    ));
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return 'Network error: ${failure.message}';
    } else if (failure is ServerFailure) {
      return 'Server error: ${failure.message}';
    } else {
      return 'An error occurred: \n ${failure.message}';
    }
  }
}
