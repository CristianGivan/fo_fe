import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'tag_bloc_event.dart';
part 'tag_bloc_state.dart';

class TagBlocTag extends Bloc<TagBlocEvent, TagBlocState> {
  final AddTag addTag;
  final UpdateTag updateTag;
  final DeleteTag deleteTag;
  final GetTagById getTagById;
  final GetTagItemsAll getTagItemsAll;
  final GetTagItemsByIdSet getTagItemsByIdSet;

  TagBlocTag({
    required this.addTag,
    required this.updateTag,
    required this.deleteTag,
    required this.getTagById,
    required this.getTagItemsAll,
    required this.getTagItemsByIdSet,
  }) : super(TagInitialBlocState()) {
    on<AddTagBlocEvent>(_onAddTag);
    on<UpdateTagBlocEvent>(_onUpdateTag);
    on<DeleteTagBlocEvent>(_onDeleteTag);
    on<GetTagByIdBlocEvent>(_onGetTagById);
    on<GetTagItemsAllBlocEvent>(_onGetTagItemsAll);
    on<GetTagItemsByIdSetBlocEvent>(_onGetTagItemsByIdSet);
  }

  Future<void> _onAddTag(
      AddTagBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrSuccess = await addTag(AddTagParams(tag: event.tag));
    failureOrSuccess.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(TagSuccessBlocState(success)),
    );
    add(GetTagItemsAllBlocEvent());
  }

  Future<void> _onUpdateTag(
      UpdateTagBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrSuccess = await updateTag(UpdateTagParams(tag: event.tag));
    failureOrSuccess.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(success
          ? TagSuccessBlocState(event.tag.id)
          : TagErrorBlocState('Update failed')),
    );
  }

  Future<void> _onDeleteTag(
      DeleteTagBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrSuccess =
        await deleteTag(DeleteTagParams(tagId: event.tagId));
    failureOrSuccess.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(TagSuccessBlocState(success)),
    );
  }

  Future<void> _onGetTagById(
      GetTagByIdBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrTag = await getTagById(GetTagByIdParams(id: event.id));
    failureOrTag.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (tag) => tag != null
          ? emit(SingleTagLoadedBlocState(tag))
          : emit(TagErrorBlocState('Tag not found')),
    );
  }

  Future<void> _onGetTagItemsAll(
      GetTagItemsAllBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrTags = await getTagItemsAll(NoParams());
    failureOrTags.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (tags) => emit(TagItemsLoadedBlocState(tags)),
    );
  }

  Future<void> _onGetTagItemsByIdSet(
      GetTagItemsByIdSetBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrTags =
        await getTagItemsByIdSet(IdSetParams(idSet: event.idSet));
    failureOrTags.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (tags) => emit(TagItemsLoadedBlocState(tags)),
    );
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
        return 'Unexpected error occurred';
    }
  }
}
