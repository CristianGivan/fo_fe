part of 'task_bloc.dart';

class TaskBlocUser extends Bloc<TaskBlocUserEvent, TaskBlocUserState> {
  final GetUsersByTaskId getUsersByTaskId;
  final AddUserToTask addUserToTask;
  final DeleteUserFromTask deleteUserFromTask;

  TaskBlocUser({
    required this.getUsersByTaskId,
    required this.addUserToTask,
    required this.deleteUserFromTask,
  }) : super(UserLoadingBlocState());

  @override
  Stream<TaskBlocUserState> mapEventToState(TaskBlocUserEvent event) async* {
    if (event is GetUsersByTaskIdBlocEvent) {
      yield UserLoadingBlocState();
      final failureOrUsers =
          await getUsersByTaskId(GetUsersByTaskIdParams(taskId: event.taskId));
      yield failureOrUsers.fold(
        (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
        (users) => UserLoadedBlocState(users),
      );
    } else if (event is AddUserToTaskBlocEvent) {
      final failureOrSuccess = await addUserToTask(
          AddUserToTaskParams(taskId: event.taskId, userId: event.user.id));
      yield failureOrSuccess.fold(
        (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
        (_) => UserAddedToTaskBlocState(),
      );
    } else if (event is DeleteUserFromTaskBlocEvent) {
      final failureOrSuccess = await deleteUserFromTask(
          DeleteUserFromTaskParams(taskId: event.taskId, userId: event.userId));
      yield failureOrSuccess.fold(
        (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
        (_) => UserDeletedFromTaskBlocState(),
      );
    }
  }
}
