import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TagLocalDataSource {
  Future<int> addTag(TagTableDriftCompanion tagCompanion);

  Future<bool> updateTag(TagTableDriftCompanion tagCompanion);

  Future<int> deleteTag(int tagId);

  Future<TagTableDriftG?> getTagById(int id);

  Future<List<TagTableDriftG>?> getTagItemsAll();

  Future<List<TagTableDriftG?>?> getTagItemsByIdSet(IdSet idSet);

  Future<List<QueryRow>?> getTagItemsFromUser(int userId);

  // User operations related to tags

  Future<TagUserLinkTableDriftG?> addTagUserLink(
      TagUserLinkTableDriftCompanion tagUserLinkCompanion);

  Future<TagUserLinkTableDriftG?> updateTagUserLink(
      TagUserLinkTableDriftCompanion tagUserLinkCompanion);

  Future<void> deleteUserItemsFromTag(int tagId, List<int> userIds);

  Future<List<UserTableDriftG?>?> getUserItemsByTagId(int tagId);

  Future<UserTableDriftG?> getCreatorById(int creatorId);

  Future<void> addUserItemsFromTag(int tagId, List<int> userIds);
}
