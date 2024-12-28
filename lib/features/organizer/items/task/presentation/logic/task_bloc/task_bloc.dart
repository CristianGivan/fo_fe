import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/get_items_from_logIn_user_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_reminder_link/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_user_link/update_task_user_link_usecase.dart';
import 'package:fo_fe/features/organizer/items/task/domain/usecases/task_user_link/update_user_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/bloc/organizer_bloc.dart';
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

class TaskBloc extends OrganizerBloc<TaskDto, TaskParams> {
  final TaskSortUseCase sortTasksUseCase;
  final TaskFilterUseCase filterTasksUseCase;

  TaskBloc({
    required GetItemsFromLogInUserUseCase<TaskDto, TaskParams> fetchTasks,
    required AddItemUseCase<TaskDto, TaskParams> addTask,
    required UpdateItemUseCase<TaskDto, TaskParams> updateTask,
    required DeleteItemUseCase deleteTask,
    required this.sortTasksUseCase,
    required this.filterTasksUseCase,
  }) : super(
          fetchItems: fetchTasks,
          addItem: addTask,
          updateItem: updateTask,
          deleteItem: deleteTask,
        ) {
    setupEventHandlers();
    on<TaskItemsSortBlocEvent<TaskDto, SortTasksParams>>(_onSortTasks as EventHandler<
        TaskItemsSortBlocEvent<TaskDto, SortTasksParams>, OrganizerBlocState<TaskDto>>);
    on<TaskItemsFilterBlocEvent<TaskDto, FilterTasksParams>>(_onFilterTasks as EventHandler<
        TaskItemsFilterBlocEvent<TaskDto, FilterTasksParams>, OrganizerBlocState<TaskDto>>);
  }

  Future<void> _onSortTasks(TaskItemsSortBlocEvent<TaskDto, SortTasksParams> event,
      Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    // if (state.status == OrganizerBlocStatus.loaded && state.displayedItems != null) {
    //   final result = await sortTasksUseCase(event.sortParams);
    //   result.fold(
    //     (failure) => emit(state.copyWith(
    //         status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
    //     (sortedTasks) => emit(state.copyWith(displayedItems: sortedTasks)),
    //   );
    // }
  }

  Future<void> _onFilterTasks(TaskItemsFilterBlocEvent<TaskDto, FilterTasksParams> event,
      Emitter<OrganizerBlocState<ItemEntity>> emit) async {
    // if (state.status == OrganizerBlocStatus.loaded && state.displayedItems != null) {
    //   final result = await filterTasksUseCase(event.filterParams);
    //   result.fold(
    //     (failure) => emit(state.copyWith(
    //         status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
    //     (filteredTasks) => emit(state.copyWith(displayedItems: filteredTasks)),
    //   );
    //   }
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
}
