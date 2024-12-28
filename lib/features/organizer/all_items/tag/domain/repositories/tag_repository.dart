import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TagRepository {
  Future<Either<Failure, int>> addTag(TagEntity tag);

  Future<Either<Failure, bool>> updateTag(TagEntity tag);

  Future<Either<Failure, int>> deleteTag(int tagId);

  Future<Either<Failure, TagEntity?>> getTagById(int id);

  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsAll();

  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByIdSet(IdSet idSet);
}
