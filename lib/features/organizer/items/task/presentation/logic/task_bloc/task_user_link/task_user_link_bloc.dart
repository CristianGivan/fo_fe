part of '../task_bloc.dart';

class TaskBlocUser extends Bloc<TaskBlocUserEvent, TaskUserBlocState> {
  final GetUsersByTaskId getUsersByTaskId;

  TaskBlocUser({
    required this.getUsersByTaskId,
  }) : super(UserLoadingBlocState());

  Stream<TaskUserBlocState> mapEventToState(TaskBlocUserEvent event) async* {
    if (event is GetUsersByTaskIdBlocEvent) {
      yield UserLoadingBlocState();
      final failureOrUsers = await getUsersByTaskId(GetUsersByTaskIdParams(taskId: event.taskId));
      yield failureOrUsers.fold(
        (failure) => UserErrorBlocState(_mapFailureToMessage(failure)),
        (users) => UserLoadedBlocState(users),
      );
    }
  }
}
