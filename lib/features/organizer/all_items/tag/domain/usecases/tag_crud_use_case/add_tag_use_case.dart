import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/update_link_ids_params.dart';
import 'package:get_it/get_it.dart';

//todo -refactor-
class AddTagUseCase extends UseCase<TagDto, AddItemParams> {
  final TagRepository repository;

  AddTagUseCase(this.repository);

  @override
  Future<Either<Failure, TagDto>> call(AddItemParams params) async {
    return _handleAddTag(params.item as TagEntity, params.itemLinkParams);
  }

  Future<Either<Failure, TagDto>> _handleAddTag(
      TagEntity tagEntity, ItemLinkParams? itemLinkParams) async {
    final failureOrTag = await repository.addTag(tagEntity);
    return failureOrTag.fold(
      (failure) => Left(failure),
      (tag) => addTagUserLinkAndReturnTagDto(tag, itemLinkParams),
    );
  }

  Future<Either<Failure, TagDto>> addTagUserLinkAndReturnTagDto(
      TagEntity tag, ItemLinkParams? itemLinkParams) async {
    final failureOrTagUserLink = await repository.addTagUserLink(TagUserLinkEntity(
      id: 0,
      tagId: tag.id,
      userId: tag.creatorId,
      selectedByUser: false,
      orderedByUser: 0,
      linkingDate: DateTime.now(),
    ));
    return failureOrTagUserLink.fold(
      (failure) => Left(failure),
      (tagUserLink) {
        TagDto tagDto = TagDto(tag: tag, tagUserLink: tagUserLink);
        if (itemLinkParams == null) {
          return Right(tagDto);
        } else {
          return Right(_handleTagLinks(tagDto, itemLinkParams));
        }
      },
    );
  }

  TagDto _handleTagLinks(TagDto tagDto, ItemLinkParams linkedItemId) {
    TaskRepository taskRepository = GetIt.I<TaskRepository>();
    ItemLinkIdsParams updateLinkParams = ItemLinkIdsParams(
      itemId: linkedItemId.itemId,
      addedItems: IdSet.of([tagDto.tag.id]),
    );
    taskRepository.updateTaskTagItems(updateLinkParams);
    return tagDto;
  }
}
