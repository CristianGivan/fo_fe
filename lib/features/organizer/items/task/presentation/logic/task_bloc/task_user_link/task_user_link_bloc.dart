part of '../task_bloc.dart';

class TaskUserLinkBloc extends Bloc<TaskUserLinkBlocEvent, TaskUserLinkBlocState> {
  final GetUserItemsByTaskIdUseCase getUserItemsByTaskId;
  final GetCreatorByTaskIdUseCase getCreatorByTaskId;
  final UpdateUserItemsOfTaskUseCase updateUserItemsOfTask;
  final UpdateTaskUserLinkUseCase updateTaskUserLink;

  TaskUserLinkBloc({
    required this.getUserItemsByTaskId,
    required this.getCreatorByTaskId,
    required this.updateUserItemsOfTask,
    required this.updateTaskUserLink,
  }) : super(TaskUserLoadingBlocState()) {
    on<GetUserItemsByTaskIdBlocEvent>(_onGetUserItemsByTaskId);
    on<GetCreatorByTaskIdBlocEvent>(_onGetCreatorByTaskId);
    on<UpdateUserItemsOfTaskBlocEvent>(_onUpdateUserItemsOfTask);
    on<UpdateTaskUserLinkBlocEvent>(_onUpdateTaskUserLink);
  }

  Future<void> _onGetUserItemsByTaskId(
    GetUserItemsByTaskIdBlocEvent event,
    Emitter<TaskUserLinkBlocState> emit,
  ) async {
    emit(TaskUserLoadingBlocState());
    final failureOrUsers = await getUserItemsByTaskId(TaskParams(id: event.taskId));
    emit(failureOrUsers.fold(
      (failure) => TaskUserErrorBlocState(_mapFailureToMessage(failure)),
      (users) => TaskUserLoadedBlocState(users),
    ));
  }

  Future<void> _onUpdateUserItemsOfTask(
    UpdateUserItemsOfTaskBlocEvent event,
    Emitter<TaskUserLinkBlocState> emit,
  ) async {
    emit(TaskUserLoadingBlocState());
    final failureOrOrganizerItems = await updateUserItemsOfTask(UpdateItemsToTaskParams(
      taskId: event.taskId,
      items: event.userItems,
      updatedItems: event.updatedUserItems,
    ));
    emit(failureOrOrganizerItems.fold(
      (failure) => TaskUserErrorBlocState(_mapFailureToMessage(failure)),
      (organizerItems) => UserItemsUpdatedToTaskBlocState(organizerItems),
    ));
  }

  FutureOr<void> _onGetCreatorByTaskId(event, Emitter<TaskUserLinkBlocState> emit) {}

  Future<void> _onUpdateTaskUserLink(
      UpdateTaskUserLinkBlocEvent event, Emitter<TaskUserLinkBlocState> emit) async {
    emit(TaskUserLoadingBlocState());
    final failureOrTaskUserLink =
        await updateTaskUserLink(TaskParams(taskUserLinkEntity: event.taskUserLink));
    emit(
      failureOrTaskUserLink.fold((failure) => TaskUserErrorBlocState(_mapFailureToMessage(failure)),
          (taskUserLink) => TaskUserLinkLoadedBlocState(taskUserLink)),
    );
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
