import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/export_task_to_excel_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_reminder_link/update_reminder_items_of_task_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_link_items_of_item_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/update_task_dto_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
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

class TaskBloc extends OrganizerBloc<TaskDto> {
  final TaskSortUseCase sortTasksUseCase;
  final TaskFilterUseCase filterTasksUseCase;
  final UpdateTaskDtoUseCase updateTaskDtoUseCase;
  final ExportTaskToExcelUseCase exportTaskToExcelUseCase;

  TaskBloc({
    required AddItemUseCase<TaskDto> addTask,
    required GetItemsFromLogInUserUseCase<TaskDto> getTasks,
    required DeleteItemsUseCase<TaskDto> deleteTask,
    required this.exportTaskToExcelUseCase,
    required this.sortTasksUseCase,
    required this.filterTasksUseCase,
    required this.updateTaskDtoUseCase,
  }) : super(
          addItem: addTask,
          getItems: getTasks,
          deleteItems: deleteTask,
        ) {
    setupEventHandlers();
    on<TaskItemsSortBlocEvent<SortTasksParams>>(_onSortTasks);
    on<TaskItemsFilterBlocEvent<FilterTasksParams>>(_onFilterTasks);
    on<UpdateTaskBlocEvent<TaskParams>>(_onUpdateTask);
    on<ExportTaskToExcelBlocEvent>(_onExportTaskToExcel);
  }

  Future<void> _onExportTaskToExcel(
      ExportTaskToExcelBlocEvent event, Emitter<OrganizerBlocState<TaskDto>> emit) async {
    await handleEvent(
      emit: emit,
      action: () => exportTaskToExcelUseCase(event.params),
      onSuccess: (items) => emit(state.copyWith(status: OrganizerBlocStatus.loaded)),
    );
  }

  Future<void> _onUpdateTask(
      UpdateTaskBlocEvent<TaskParams> event, Emitter<OrganizerBlocState<TaskDto>> emit) async {
    await handleEvent(
      emit: emit,
      action: () => updateTaskDtoUseCase(event.params),
      originalItems: (updatedTask) => state.originalItems.copyWithUpdatedItem(updatedTask),
      displayedItems: (updatedTask) => state.displayedItems.copyWithUpdatedItem(updatedTask),
    );
  }

  Future<void> _onSortTasks(TaskItemsSortBlocEvent<SortTasksParams> event,
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

  Future<void> _onFilterTasks(TaskItemsFilterBlocEvent<FilterTasksParams> event,
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
