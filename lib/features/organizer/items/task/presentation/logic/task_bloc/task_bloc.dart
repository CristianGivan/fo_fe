import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_task_items_from_logIn_user_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_reminder_link/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_user_link/update_task_user_link_usecase.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_user_link/update_user_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/update_task_dto_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'task_bloc_event.dart';
part 'task_bloc_state.dart';
part 'task_reminder_link/task_reminder_link_bloc.dart';
part 'task_reminder_link/task_reminder_link_bloc_event.dart';
part 'task_reminder_link/task_reminder_link_bloc_state.dart';
part 'task_tag_link/task_tag_link_bloc.dart';
part 'task_tag_link/task_tag_link_bloc_event.dart';
part 'task_tag_link/task_tag_link_bloc_state.dart';
part 'task_user_link/task_user_link_bloc.dart';
part 'task_user_link/task_user_link_bloc_event.dart';
part 'task_user_link/task_user_link_bloc_state.dart';

class TaskBloc extends Bloc<OrganizerBlocEvent, TaskBlocState> {
  final GetTaskByIdUseCase getTaskById;
  final GetTaskItemsAllUseCase getTaskItemsAll;
  final GetTaskItemsFromLogInUserUseCase getTaskItemsFromLogInUser;
  final GetTaskItemsByIdSetUseCase getTaskItemsByIdSet;
  final AddTaskUseCase addTask;
  final UpdateTaskUseCase updateTask;
  final UpdateTaskDtoUseCase updateTaskDto;
  final DeleteTaskUseCase deleteTask;
  final TaskSortUseCase sortTasksUseCase;
  final TaskFilterUseCase filterTasksUseCase;

  TaskBloc({
    required this.getTaskById,
    required this.getTaskItemsAll,
    required this.getTaskItemsFromLogInUser,
    required this.getTaskItemsByIdSet,
    required this.addTask,
    required this.updateTask,
    required this.updateTaskDto,
    required this.deleteTask,
    required this.sortTasksUseCase,
    required this.filterTasksUseCase,
  }) : super(TaskInitialBlocState()) {
    // on<TaskGetByIdBlocEvent>(_onGetTaskByIdBlocEvent);
    // on<TaskItemsGetAllBlocEvent>(_onLoadTaskItemsAllBlocEvent);
    on<GetItemsFromLogInUserBlocEvent>(_onGetTaskItemsFromLogInUserBlocEvent);
    // on<TaskItemsSortBlocEvent>(_onTaskItemsSortBlocEvent);
    // on<TaskItemsFilterBlocEvent>(_onTaskItemsFilterBlocEvent);
    // on<TaskLoadItemsByIdSetBlocEvent>(_onLoadTaskItemsByIdSetBlocEvent);
    on<AddItemBlocEvent>(_onAddTaskBlocEvent);
    on<UpdateItemBlocEvent>(_onUpdateTaskBlocEvent);
    on<UpdateDisplayItemsWithItemBlocEvent>(_onUpdateTaskDtoDisplayItemsBlocEvent);
    // on<UpdateTaskUserLinkBlocEvent>(_onUpdateTaskUserLinkBlocEvent);
    // on<TaskDeleteBlocEvent>(_onDeleteTaskBlocEvent);
    // on<ToggleTaskSelectionBlocEvent>(_onToggleTaskSelectionBlocEvent);
  }

  //

  void _onGetTaskItemsFromLogInUserBlocEvent(
      GetItemsFromLogInUserBlocEvent event, Emitter<TaskBlocState> emit) async {
    emit(TaskLoadingBlocState());
    final failureOrTasks = await (getTaskItemsFromLogInUser(event.param));
    emit(failureOrTasks.fold(
      (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
      (tasks) => TaskDtoItemsLoadedBlocState(originalTaskItems: tasks, displayedTaskItems: tasks),
    ));
  }

  void _onAddTaskBlocEvent(AddItemBlocEvent event, Emitter<TaskBlocState> emit) async {
    final oldState = state;
    emit(TaskLoadingBlocState());
    final failureOrTask = await addTask(TaskParams(task: event.item));
    failureOrTask.fold(
      (failure) => emit(TaskErrorBlocState(message: _mapFailureToMessage(failure))),
      (newTask) => emitAddAndLoadedState(oldState, newTask, emit),
    );
  }

  void emitAddAndLoadedState(TaskBlocState oldState, TaskDto newTask, Emitter<TaskBlocState> emit) {
    final OrganizerItems<ItemEntity> updatedOriginalTasks;
    final OrganizerItems<ItemEntity> updatedDisplayedTasks;

    if (oldState is TaskDtoItemsLoadedBlocState) {
      updatedOriginalTasks = oldState.originalTaskItems;
      updatedDisplayedTasks = oldState.displayedTaskItems.copyWithAddedItem(newTask);
    } else {
      updatedOriginalTasks = OrganizerItems.of([newTask]);
      updatedDisplayedTasks = OrganizerItems.of([newTask]);
    }

    emit(TaskAddedBlocState());
    emit(TaskDtoItemsLoadedBlocState(
        originalTaskItems: updatedOriginalTasks, displayedTaskItems: updatedDisplayedTasks));
  }

  void _onUpdateTaskBlocEvent(
    UpdateItemBlocEvent event,
    Emitter<TaskBlocState> emit,
  ) async {
    if (state is TaskDtoItemsLoadedBlocState) {
      final currentState = state as TaskDtoItemsLoadedBlocState;
      emit(TaskLoadingBlocState());
      final failureOrSuccess = await updateTask(TaskParams(task: event.item));
      failureOrSuccess.fold(
        (failure) => emit(TaskErrorBlocState(message: _mapFailureToMessage(failure))),
        (updatedTask) {
          final updatedOriginalTasks = currentState.originalTaskItems;
          final updatedDisplayedTasks =
              currentState.displayedTaskItems.copyWithUpdatedItem(updatedTask);
          emit(TaskUpdatedBlocState());
          emit(TaskDtoItemsLoadedBlocState(
            originalTaskItems: updatedOriginalTasks,
            displayedTaskItems: updatedDisplayedTasks,
          ));
        },
      );
    } else {
      emit(TaskErrorBlocState(message: 'TaskLoadedBlocState is required'));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return 'Network error occurred';
      case ServerFailure:
        return 'Server error occurred';
      case CacheFailure:
        return 'Cache error occurred';
      default:
        return 'An error occurred: \n ${failure.message}';
    }
  }

// void _onDeleteTaskBlocEvent(
//     TaskDeleteBlocEvent event,
//     Emitter<TaskBlocState> emit,
//     ) async {
//   emit(TaskLoadingBlocState());
//   final failureOrSuccess = await deleteTask(TaskParams(id: event.taskId));
//   emit(failureOrSuccess.fold(
//         (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//         (success) => TaskDeletedBlocState(),
//   ));
//   add(TaskItemsGetAllBlocEvent()); // Refresh the task list
// }
//
// void _onLoadTaskItemsByIdSetBlocEvent(
//   TaskLoadItemsByIdSetBlocEvent event,
//   Emitter<TaskBlocState> emit,
// ) async {
//   emit(TaskLoadingBlocState());
//   final failureOrTasks = await getTaskItemsByIdSet(TaskParams(idSet: event.idSet));
//   emit(failureOrTasks.fold(
//     (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//     (tasks) => TaskLoadedBlocState(originalTasks: tasks, displayedTasks: tasks),
//   ));
// }

// void _onTaskItemsFilterBlocEvent(
//     TaskItemsFilterBlocEvent event,
//     Emitter<TaskBlocState> emit,
//     ) async {
//   if (state is TaskLoadedBlocState) {
//     final currentState = state as TaskLoadedBlocState;
//
//     final failureOrFilteredTasks = await filterTasksUseCase(event.filterParams.copyWith(
//       displayedTasks: currentState.displayedTasks,
//     ));
//
//     emit(failureOrFilteredTasks.fold(
//           (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//           (filteredTasks) => TaskLoadedBlocState(
//         originalTasks: currentState.originalTasks,
//         displayedTasks: filteredTasks,
//       ),
//     ));
//   }
// }
//
// void _onTaskItemsSortBlocEvent(
//     TaskItemsSortBlocEvent event,
//     Emitter<TaskBlocState> emit,
//     ) async {
//   if (state is TaskLoadedBlocState) {
//     final currentState = state as TaskLoadedBlocState;
//     final originalTasks = currentState.originalTasks;
//     final displayedTasks = currentState.displayedTasks;
//
//     final failureOrSortedTasks =
//     await sortTasksUseCase(event.sortParams.copyWith(tasks: displayedTasks));
//
//     emit(failureOrSortedTasks.fold(
//           (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//           (sortedTasks) => TaskLoadedBlocState(
//         originalTasks: originalTasks,
//         displayedTasks: sortedTasks,
//       ),
//     ));
//   }
// }

// void _onTaskItemsFromLogInUserBlocEvent(
//     GetTaskItemsFromLogInUserBlocEvent event,
//     Emitter<TaskBlocState> emit,
//     ) async {
//   emit(TaskLoadingBlocState());
//   final Either<Failure, OrganizerItems<ItemEntity>> failureOrTasks =
//   await (getTaskItemsFromLogInUser(event.taskParams));
//   emit(failureOrTasks.fold(
//         (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//         (tasks) => event.taskParams.itemReturn == ItemReturn.entity
//         ? TaskLoadedBlocState(
//       originalTasks: tasks as OrganizerItems<TaskEntity>,
//       displayedTasks: tasks as OrganizerItems<TaskEntity>,
//     )
//         : TaskItemsLoadedDtoBlocState(
//       originalTasks: tasks,
//       displayedTasks: tasks,
//     ),
//   ));
// }
// void _onGetTaskByIdBlocEvent(
//   TaskGetByIdBlocEvent event,
//   Emitter<TaskBlocState> emit,
// ) async {
//   emit(TaskLoadingBlocState());
//   final failureOrTask = await getTaskById(TaskParams(id: event.taskId));
//   emit(failureOrTask.fold(
//     (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//     (task) => TaskLoadedBlocState(
//         originalTasks: OrganizerItems.of([task]), displayedTasks: OrganizerItems.of([task])),
//   ));
// }
//
// void _onToggleTaskSelectionBlocEvent(event, emit) {
//   if (state is TaskLoadedBlocState) {
//     final currentState = state as TaskLoadedBlocState;
//     final newSelectedTasks = currentState.selectedTasks.toBuilder();
//     if (currentState.selectedTasks.contains(event.taskId)) {
//       newSelectedTasks.remove(event.taskId);
//     } else {
//       newSelectedTasks.add(event.taskId);
//     }
//     emit(currentState.copyWith(selectedTasks: newSelectedTasks.build()));
//   }
// }
// void _onLoadTaskItemsAllBlocEvent(
//   TaskItemsGetAllBlocEvent event,
//   Emitter<TaskBlocState> emit,
// ) async {
//   emit(TaskLoadingBlocState());
//   final failureOrTasks = await getTaskItemsAll(NoParams());
//   emit(failureOrTasks.fold(
//     (failure) => TaskErrorBlocState(message: _mapFailureToMessage(failure)),
//     (tasks) => TaskLoadedBlocState(
//         originalTasks: tasks as OrganizerItems<TaskEntity>,
//         displayedTasks: tasks as OrganizerItems<TaskEntity>),
//   ));
// }

  FutureOr<void> _onUpdateTaskDtoDisplayItemsBlocEvent(
      UpdateDisplayItemsWithItemBlocEvent event, Emitter<TaskBlocState> emit) async {
    if (state is TaskDtoItemsLoadedBlocState) {
      final currentState = state as TaskDtoItemsLoadedBlocState;
      final updatedDisplayedTasks =
          currentState.displayedTaskItems.copyWithUpdatedItem(event.updatedDisplayedTasks);
      emit(TaskDtoItemsLoadedBlocState(
        originalTaskItems: currentState.originalTaskItems,
        displayedTaskItems: updatedDisplayedTasks,
      ));
    }
  }
}
