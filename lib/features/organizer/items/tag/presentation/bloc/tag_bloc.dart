import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/parameters/tag_params.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'tag_bloc_event.dart';
part 'tag_bloc_state.dart';

class TagBlocTag extends Bloc<TagBlocEvent, TagBlocState> {
  final AddTagUseCase addTag;
  final UpdateTagUseCase updateTag;
  final DeleteTagUseCase deleteTag;
  final GetTagByIdUseCase getTagById;
  final GetTagItemsAllUseCase getTagItemsAll;
  final GetTagItemsByIdSetUseCase getTagItemsByIdSet;

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

  Future<void> _onAddTag(AddTagBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrSuccess = await addTag(TagParams(tag: event.tag));
    failureOrSuccess.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(TagSuccessBlocState(success)),
    );
    add(GetTagItemsAllBlocEvent());
  }

  Future<void> _onUpdateTag(UpdateTagBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrSuccess = await updateTag(TagParams(tag: event.tag));
    failureOrSuccess.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (success) =>
          emit(success ? TagSuccessBlocState(event.tag.id) : TagErrorBlocState('Update failed')),
    );
  }

  Future<void> _onDeleteTag(DeleteTagBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrSuccess = await deleteTag(TagParams(tagId: event.tagId));
    failureOrSuccess.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (success) => emit(TagSuccessBlocState(success)),
    );
  }

  Future<void> _onGetTagById(GetTagByIdBlocEvent event, Emitter<TagBlocState> emit) async {
    emit(TagLoadingBlocState());
    final failureOrTag = await getTagById(TagParams(tagId: event.id));
    failureOrTag.fold(
      (failure) => emit(TagErrorBlocState(_mapFailureToMessage(failure))),
      (tag) => tag != null
          ? emit(SingleTagLoadedBlocState(tag))
          : emit(TagErrorBlocState('Tag not found')),
    );
  }

  Future<void> _onGetTagItemsAll(GetTagItemsAllBlocEvent event, Emitter<TagBlocState> emit) async {
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
    final failureOrTags = await getTagItemsByIdSet(TagParams(idSet: event.idSet));
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
        return 'An error occurred: ${failure.message}';
    }
  }
}
