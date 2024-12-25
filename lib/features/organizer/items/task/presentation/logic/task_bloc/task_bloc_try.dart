// import 'package:fo_fe/core/error/failures.dart';
// import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_items_from_logIn_user_use_case.dart';
// import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
// import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
//
// part 'organizer_bloc_event.dart';
// part 'task_bloc_state_try.dart';
//
// class TaskBlocTry extends Bloc<OrganizerBlocEvent, TaskBlocStateTry> {
//   final GetTaskItemsFromLogInUserUseCase getTaskItemsFromLogInUser;
//
//   TaskBlocTry({
//     required this.getTaskItemsFromLogInUser,
//   }) : super(TaskInitialBlocStateTry()) {
//     on<GetItemsFromLogInUserBlocEventTry<TaskEntity>>(_onGetTaskItemsFromLogInUserBlocEvent);
//   }
//
//   void _onGetTaskItemsFromLogInUserBlocEvent<TaskEntity>(
//       GetItemsFromLogInUserBlocEventTry event, Emitter<TaskBlocStateTry> emit) async {
//     emit(TaskLoadingBlocStateTry());
//     final failureOrTasks = await (getTaskItemsFromLogInUser(event.param));
//     emit(failureOrTasks.fold(
//       (failure) => TaskErrorBlocStateTry(message: _mapFailureToMessage(failure)),
//       (tasks) =>
//           TaskDtoItemsLoadedBlocStateTry(originalTaskItems: tasks, displayedTaskItems: tasks),
//     ));
//   }
//
//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case NetworkFailure:
//         return 'Network error occurred';
//       case ServerFailure:
//         return 'Server error occurred';
//       case CacheFailure:
//         return 'Cache error occurred';
//       default:
//         return 'An error occurred: \n ${failure.message}';
//     }
//   }
// }
