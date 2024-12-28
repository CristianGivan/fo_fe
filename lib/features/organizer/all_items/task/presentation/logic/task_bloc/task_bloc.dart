import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/domain/usecases/get_items_from_logIn_user_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_reminder_link/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_task_user_link_usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_user_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_bloc.dart';
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

class TaskBloc extends OrganizerBloc<ItemEntity, TaskParams> {
  final TaskSortUseCase sortTasksUseCase;
  final TaskFilterUseCase filterTasksUseCase;

  TaskBloc({
    required GetItemsFromLogInUserUseCase<ItemEntity, TaskParams> fetchTasks,
    required AddItemUseCase<ItemEntity, TaskParams> addTask,
    required UpdateItemUseCase<ItemEntity, TaskParams> updateTask,
    required DeleteItemUseCase<ItemEntity, TaskParams> deleteTask,
    required this.sortTasksUseCase,
    required this.filterTasksUseCase,
  }) : super(
          getItems: fetchTasks,
          addItem: addTask,
          updateItem: updateTask,
          deleteItem: deleteTask,
        ) {
    setupEventHandlers();
    on<TaskItemsSortBlocEvent<ItemEntity, SortTasksParams>>(_onSortTasks as EventHandler<
        TaskItemsSortBlocEvent<ItemEntity, SortTasksParams>, OrganizerBlocState<ItemEntity>>);
    on<TaskItemsFilterBlocEvent<ItemEntity, FilterTasksParams>>(_onFilterTasks as EventHandler<
        TaskItemsFilterBlocEvent<ItemEntity, FilterTasksParams>, OrganizerBlocState<ItemEntity>>);
  }

  Future<void> _onSortTasks(TaskItemsSortBlocEvent<ItemEntity, SortTasksParams> event,
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

  Future<void> _onFilterTasks(TaskItemsFilterBlocEvent<ItemEntity, FilterTasksParams> event,
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
