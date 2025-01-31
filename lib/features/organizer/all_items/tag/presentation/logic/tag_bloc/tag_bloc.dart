import 'dart:async';

import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/get_tag_items_from_log_in_user.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/usecases/tag_crud_use_case/add_tag_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

part 'tag_bloc_event.dart';
part 'tag_bloc_state.dart';

class TagBloc extends OrganizerBloc<TagDto> {
  // final TagSortUseCase sortTagsUseCase;
  // final TagFilterUseCase filterTagsUseCase;
  // final UpdateTagUseCase updateTagUseCase;
  // final ExportTagToExcelUseCase exportTagToExcelUseCase;

  TagBloc(// required this.exportTagToExcelUseCase,
      // required this.sortTagsUseCase,
      // required this.filterTagsUseCase,
      // required this.updateTagUseCase,
      )
      : super(
          addItem: GetIt.instance.get<AddTagUseCase>().call,
          getItems: GetIt.instance.get<GetTagItemsFromLogInUserUseCase>().call,
          deleteItems: GetIt.instance.get<DeleteTagUseCase>().call,
        ) {
    setupEventHandlers();
    // on<TagItemsSortBlocEvent<SortTagsParams>>(_onSortTags);
    // on<TagItemsFilterBlocEvent<FilterTagsParams>>(_onFilterTags);
    on<UpdateTagBlocEvent<TagParams>>(_onUpdateTag);
    on<ExportTagToExcelBlocEvent>(_onExportTagToExcel);
  }

  Future<void> _onExportTagToExcel(
      ExportTagToExcelBlocEvent event, Emitter<OrganizerBlocState<TagDto>> emit) async {
    // await handleEvent(
    //   emit: emit,
    //   action: () => exportTagToExcelUseCase(event.params),
    //   onSuccess: (items) => emit(state.copyWith(status: OrganizerBlocStatus.loaded)),
    // );
  }

  Future<void> _onUpdateTag(
      UpdateTagBlocEvent<TagParams> event, Emitter<OrganizerBlocState<TagDto>> emit) async {
    // await handleEvent(
    //   emit: emit,
    //   action: () => updateTagUseCase(event.params),
    //   originalItems: (updatedTag) => state.originalItems.copyWithUpdatedItem(updatedTag),
    //   displayedItems: (updatedTag) => state.displayedItems.copyWithUpdatedItem(updatedTag),
    // );
  }

// Future<void> _onSortTags(TagItemsSortBlocEvent<SortTagsParams> event,
//     Emitter<OrganizerBlocState<ItemEntity>> emit) async {
//   // if (state.status == OrganizerBlocStatus.loaded && state.displayedItems != null) {
//   //   final result = await sortTagsUseCase(event.sortParams);
//   //   result.fold(
//   //     (failure) => emit(state.copyWith(
//   //         status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
//   //     (sortedTags) => emit(state.copyWith(displayedItems: sortedTags)),
//   //   );
//   // }
// }

// Future<void> _onFilterTags(TagItemsFilterBlocEvent<FilterTagsParams> event,
//     Emitter<OrganizerBlocState<ItemEntity>> emit) async {
//   // if (state.status == OrganizerBlocStatus.loaded && state.displayedItems != null) {
//   //   final result = await filterTagsUseCase(event.filterParams);
//   //   result.fold(
//   //     (failure) => emit(state.copyWith(
//   //         status: OrganizerBlocStatus.error, errorMessage: _mapFailureToMessage(failure))),
//   //     (filteredTags) => emit(state.copyWith(displayedItems: filteredTags)),
//   //   );
//   //   }
// }

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
