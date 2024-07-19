import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';

class TagRepositoryImpl implements TagRepository {
  final TagLocalDataSource localDataSource;

  TagRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, int>> deleteTag(int tagId) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TagEntity?>> getTagById(int id) {
    // TODO: implement getTagById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsAll() {
    // TODO: implement getTagItemsAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByIdSet(
      IdSet idSet) {
    // TODO: implement getTagItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> insertTag(TagEntity tag) {
    // TODO: implement insertTag
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateTag(TagEntity tag) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }
}
