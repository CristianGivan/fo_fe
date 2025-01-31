import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/models/tag_user_link_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagRepositoryDrift implements TagRepository {
  final TagLocalDataSource localDataSource;

  TagRepositoryDrift({required this.localDataSource});

  @override
  Future<Either<Failure, TagEntity>> addTag(TagEntity tag) async {
    return _handleDatabaseOperation(() async {
      final companion = TagMapper.entityToCompanion(tag);
      _checkItemNotNull(companion);
      final tagId = await localDataSource.addTag(companion);
      final newTag = await localDataSource.getTagById(tagId);
      _checkItemNotNull(newTag);
      return TagMapper.entityFromTableDrift(newTag!);
    });
  }

  @override
  Future<Either<Failure, bool>> updateTag(TagEntity tag) async {
    return _handleDatabaseOperation(() {
      final companion = TagMapper.entityToCompanion(tag);
      _checkItemNotNull(companion);
      return localDataSource.updateTag(companion);
    });
  }

  @override
  Future<Either<Failure, int>> deleteTag(int tagId) {
    return _handleDatabaseOperation(() => localDataSource.deleteTag(tagId));
  }

  @override
  Future<Either<Failure, TagEntity>> getTagById(int id) {
    return _handleDatabaseOperation(() async {
      final item = await localDataSource.getTagById(id);
      _checkItemNotNull(item);
      return TagMapper.entityFromTableDrift(item!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsAll() {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getTagItemsAll();
      _checkItemsNotNullOrEmpty(items);
      return TagMapper.entityItemsFromTableDriftItems(items!);
    });
  }

  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByIdSet(IdSet idSet) {
    return _handleDatabaseOperation<OrganizerItems<TagEntity>>(
      () async {
        final items = await localDataSource.getTagItemsByIdSet(idSet);
        _checkItemsNotNullOrEmpty(items);

        final nonNullItems = _filterNonNullItems(items!);
        return TagMapper.entityItemsFromTableDriftItems(nonNullItems);
      },
    );
  }

  @override
  Future<Either<Failure, OrganizerItems<TagDto>>> getTagItemsFromUser(int forUserId) {
    return _handleDatabaseOperation(() async {
      final rows = await localDataSource.getTagItemsFromUser(forUserId);
      if (rows == null || rows.isEmpty) {
        return OrganizerItems<TagDto>.empty();
      } else {
        return TagMapper.itemsFromRows(rows);
      }
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagEntitiesFromUser(int forUserId) {
    return _handleDatabaseOperation(() async {
      final rows = await localDataSource.getTagItemsFromUser(forUserId);
      if (rows == null || rows.isEmpty) {
        return OrganizerItems<TagEntity>.empty();
      } else {
        return TagMapper.entitiesFromRows(rows);
      }
    });
  }

  @override
  Future<Either<Failure, TagUserLinkEntity>> addTagUserLink(TagUserLinkEntity tagUserEntity) async {
    return _handleDatabaseOperation(() async {
      final companion = TagUserLinkMapper.entityToCompanion(tagUserEntity);
      _checkItemNotNull(companion);
      final result = await localDataSource.addTagUserLink(companion);
      _checkItemNotNull(result);
      return TagUserLinkMapper.entityFromTableDrift(result!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTagId(int tagId) async {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getUserItemsByTagId(tagId);
      _checkItemsNotNullOrEmpty(items);
      final nonNullItems = items!.whereType<UserTableDriftG>().toList();
      return UserMapper.entityItemsFromTableDriftItems(nonNullItems);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getCreatorTagById(int tagId) async {
    return _handleDatabaseOperation(() async {
      final item = await localDataSource.getCreatorById(tagId);
      _checkItemNotNull(item);
      return UserMapper.entityFromTableDrift(item!);
    });
  }

  @override
  Future<Either<Failure, TagUserLinkEntity>> updateTagUserLink(
      TagUserLinkEntity tagUserEntity) async {
    return _handleDatabaseOperation(() async {
      final companion = TagUserLinkMapper.entityToCompanion(tagUserEntity);
      _checkItemNotNull(companion);
      final result = await localDataSource.updateTagUserLink(companion);
      _checkItemNotNull(result);
      return TagUserLinkMapper.entityFromTableDrift(result!);
    });
  }

  // @override
  // Future<Either<Failure, OrganizerItems<UserEntity>>> updateTagUserItems(
  //     int tagId, List<int> addedUserItems, List<int> removedUserItems) async {
  //   return _handleDatabaseOperation(() async {
  //     await localDataSource.updateTagUserItems(tagId, addedUserItems, removedUserItems);
  //     final items = await localDataSource.getUserItemsByTagId(tagId);
  //     _checkItemsNotNullOrEmpty(items);
  //     final nonNullItems = items!.whereType<UserTableDriftG>().toList();
  //     return UserMapper.entityItemsFromTableDriftItems(nonNullItems);
  //   });
  // }

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(LocalFailure(e.toString()));
      }
    }
  }

  List<TagTableDriftG> _filterNonNullItems(List<dynamic> items) {
    final nonNullItems = items.whereType<TagTableDriftG>().toList();
    if (nonNullItems.length != items.length) {
      throw const IncompleteDataFailure("Task incomplete");
    }
    if (nonNullItems.isEmpty) {
      throw const TagNotFoundFailure("Tag not found");
    }
    return nonNullItems;
  }

  void _checkItemNotNull(dynamic item) {
    if (item == null) {
      throw const TagNotFoundFailure("Tag not found");
    }
  }

  void _checkItemsNotNullOrEmpty(List<dynamic>? items) {
    if (items == null || items.isEmpty) {
      throw const TagNotFoundFailure("Tag not found");
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> updateTagUserItems(
      int tagId, List<int> addedUserItems, List<int> removedUserItems) {
    // TODO: implement updateTagUserItems
    throw UnimplementedError();
  }
}
