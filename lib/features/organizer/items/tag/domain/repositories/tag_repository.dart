import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';

abstract class TagRepository {
  Future<Either<Failure, int>> insertTag(TagEntity tag);

  Future<Either<Failure, bool>> updateTag(TagEntity tag);

  Future<Either<Failure, int>> deleteTag(int tagId);

  Future<Either<Failure, TagEntity?>> getTagById(int id);

  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsAll();

  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByIdSet(
      IdSet idSet);
}
