import 'dart:async';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/other/tag_params.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'tag_bloc_event.dart';
part 'tag_bloc_state.dart';

class TagBloc extends OrganizerBloc<Tag> {
  // final TagSortUseCase sortTagsUseCase;
  // final TagFilterUseCase filterTagsUseCase;
  // final UpdateTagUseCase updateTagUseCase;
  // final ExportTagToExcelUseCase exportTagToExcelUseCase;

  TagBloc({
    required AddItemUseCase<Tag> addTag,
    required GetItemsFromLogInUserUseCase<Tag> getTags,
    required DeleteItemsUseCase<Tag> deleteTag,
    // required this.exportTagToExcelUseCase,
    // required this.sortTagsUseCase,
    // required this.filterTagsUseCase,
    // required this.updateTagUseCase,
  }) : super(
          addItem: addTag,
          getItems: getTags,
          deleteItems: deleteTag,
        ) {
    setupEventHandlers();
    // on<TagItemsSortBlocEvent<SortTagsParams>>(_onSortTags);
    // on<TagItemsFilterBlocEvent<FilterTagsParams>>(_onFilterTags);
    on<UpdateTagBlocEvent<TagParams>>(_onUpdateTag);
    on<ExportTagToExcelBlocEvent>(_onExportTagToExcel);
  }

  Future<void> _onExportTagToExcel(
      ExportTagToExcelBlocEvent event, Emitter<OrganizerBlocState<Tag>> emit) async {
    // await handleEvent(
    //   emit: emit,
    //   action: () => exportTagToExcelUseCase(event.params),
    //   onSuccess: (items) => emit(state.copyWith(status: OrganizerBlocStatus.loaded)),
    // );
  }

  Future<void> _onUpdateTag(
      UpdateTagBlocEvent<TagParams> event, Emitter<OrganizerBlocState<Tag>> emit) async {
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
