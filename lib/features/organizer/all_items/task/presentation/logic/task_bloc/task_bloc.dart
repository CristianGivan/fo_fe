import 'dart:async';

import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/export_task_to_excel_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_crud_use_case/get_task_items_from_logIn_user_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_crud_use_case/update_task_dto_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

part 'task_bloc_event.dart';
part 'task_bloc_state.dart';

class TaskBloc extends OrganizerBloc<TaskDto> {
  final TaskSortUseCase sortTasksUseCase;
  final TaskFilterUseCase filterTasksUseCase;
  final UpdateTaskDtoUseCase updateTaskDtoUseCase;
  final ExportTaskToExcelUseCase exportTaskToExcelUseCase;

  TaskBloc({
    required this.exportTaskToExcelUseCase,
    required this.sortTasksUseCase,
    required this.filterTasksUseCase,
    required this.updateTaskDtoUseCase,
  }) : super(
          addItem: GetIt.instance.get<AddTaskUseCase>().call,
          getItems: GetIt.instance.get<GetTaskItemsFromLogInUserUseCase>().call,
          deleteItems: GetIt.instance.get<DeleteTaskItemsUseCase>().call,
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

// String _mapFailureToMessage(Failure failure) {
//   switch (failure.runtimeType) {
//     case const (NetworkFailure):
//       return 'Network error occurred';
//     case const (ServerFailure):
//       return 'Server error occurred';
//     case const (CacheFailure):
//       return 'Cache error occurred';
//     default:
//       return 'An error occurred: \n ${failure.message}';
//   }
// }
}
