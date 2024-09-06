import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class TagRepositoryDrift implements TagRepository {
  final TagLocalDataSource localDataSource;

  TagRepositoryDrift({required this.localDataSource});

  @override
  Future<Either<Failure, int>> insertTag(TagEntity tag) async {
    try {
      final id = await localDataSource.insertTag(tag);
      return Right(id);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateTag(TagEntity tag) async {
    try {
      final success = await localDataSource.updateTag(tag);
      return Right(success);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteTag(int tagId) async {
    try {
      final id = await localDataSource.deleteTag(tagId);
      return Right(id);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, TagEntity?>> getTagById(int id) async {
    try {
      final tag = await localDataSource.getTagById(id);
      return Right(tag);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsAll() async {
    try {
      final items = await localDataSource.getTagItemsAll();
      return Right(items);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByIdSet(
      IdSet idSet) async {
    try {
      final items = await localDataSource.getTagItemsByIdSet(idSet);
      return Right(items);
    } catch (e) {
      return const Left(DatabaseFailure());
    }
  }
}
