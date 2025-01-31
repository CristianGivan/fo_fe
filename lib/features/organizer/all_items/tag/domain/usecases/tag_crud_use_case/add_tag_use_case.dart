import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class AddTagUseCase extends UseCase<TagDto, ItemEntity> {
  final TagRepository repository;

  AddTagUseCase(this.repository);

  @override
  Future<Either<Failure, TagDto>> call(ItemEntity item) async {
    return _handleAddTag(item as TagEntity);
  }

  Future<Either<Failure, TagDto>> _handleAddTag(TagEntity tagEntity) async {
    final failureOrTag = await repository.addTag(tagEntity);
    return failureOrTag.fold(
      (failure) => Left(failure),
      (tag) => addTagUserLinkAndReturnTagDto(tag),
    );
  }

  Future<Either<Failure, TagDto>> addTagUserLinkAndReturnTagDto(TagEntity tag) async {
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
      (tagUserLink) => Right(TagDto(tag: tag, tagUserLink: tagUserLink)),
    );
  }
}
