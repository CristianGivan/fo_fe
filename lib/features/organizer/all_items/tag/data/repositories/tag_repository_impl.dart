import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/domain/entities/user_entity.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

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
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByIdSet(IdSet idSet) {
    // TODO: implement getTagItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TagEntity>> addTag(TagEntity tag) {
    // TODO: implement insertTag
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateTag(TagEntity tag) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagEntitiesFromUser(int userId) {
    // TODO: implement getTagEntitiesByUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TagDto>>> getTagItemsFromUser(int userId) {
    // TODO: implement getTagItemsFromUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TagUserLinkEntity>> addTagUserLink(TagUserLinkEntity tagUserEntity) {
    // TODO: implement addTagUserLink
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getCreatorTagById(int tagId) {
    // TODO: implement getCreatorTagById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTagId(int tagId) {
    // TODO: implement getUserItemsByTagId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> updateTagUserItems(
      int tagId, List<int> addedUserItems, List<int> removedUserItems) {
    // TODO: implement updateTagUserItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TagUserLinkEntity>> updateTagUserLink(TagUserLinkEntity tag) {
    // TODO: implement updateTagUserLink
    throw UnimplementedError();
  }
}
