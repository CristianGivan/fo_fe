import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagLocalDataSourceDrift implements TagLocalDataSource {
  final OrganizerDriftDB db;

  TagLocalDataSourceDrift({required this.db});

  @override
  Future<int> addTag(TagTableDriftCompanion tagCompanion) async {
    return await db.tagDaoDrift.addTag(tagCompanion);
  }

  @override
  Future<bool> updateTag(TagTableDriftCompanion tagCompanion) async {
    return await db.tagDaoDrift.updateTag(tagCompanion);
  }

  @override
  Future<int> deleteTag(int tagId) async {
    return await db.tagDaoDrift.deleteTag(tagId);
  }

  @override
  Future<TagTableDriftG?> getTagById(int id) async {
    return await db.tagDaoDrift.getTagById(id);
  }

  @override
  Future<List<TagTableDriftG>?> getTagItemsAll() async {
    return await db.tagDaoDrift.getTagItemsAll();
  }

  @override
  Future<List<TagTableDriftG?>?> getTagItemsByIdSet(IdSet idSet) async {
    return await db.tagDaoDrift.getTagItemsByIdSet(idSet.toSet());
  }

  @override
  Future<List<QueryRow>?> getTagItemsFromUser(int userId) async {
    return await db.tagDaoDrift.getTagItemsFromUser(userId);
  }

  // User operations related to tags

  @override
  Future<TagUserLinkTableDriftG?> addTagUserLink(TagUserLinkTableDriftCompanion companion) async {
    final tagUserLinkId = await db.tagUserLinkDaoDrift.addTagUser(companion);
    return _getTagUserLinkById(tagUserLinkId);
  }

  @override
  Future<TagUserLinkTableDriftG?> updateTagUserLink(
      TagUserLinkTableDriftCompanion companion) async {
    await db.tagUserLinkDaoDrift.updateTagUserLink(companion);
    return _getTagUserLinkById(companion.id.value);
  }

  @override
  Future<void> deleteUserItemsFromTag(int tagId, List<int> userItems) async {
    await db.transaction(() async {
      for (final userId in userItems) {
        await db.tagUserLinkDaoDrift.deleteTagUser(tagId, userId);
      }
    });
  }

  @override
  Future<List<UserTableDriftG?>?> getUserItemsByTagId(int tagId) async {
    final userIds = await db.tagUserLinkDaoDrift.getUserIdsByTagId(tagId);
    return await db.userDaoDrift.getUserItemsByIdSet(userIds);
  }

  @override
  Future<UserTableDriftG?> getCreatorById(int creatorId) async {
    return await db.userDaoDrift.getUserById(creatorId);
  }

  @override
  Future<void> addUserItemsFromTag(int tagId, List<int> userItems) async {
    await db.transaction(() async {
      for (final userId in userItems) {
        await db.tagUserLinkDaoDrift.addTagUser(_createSelectedTagUserCompanion(tagId, userId));
      }
    });
  }

  Future<TagUserLinkTableDriftG?> _getTagUserLinkById(int tagUserLinkId) async {
    return await db.tagUserLinkDaoDrift.getTagUserById(tagUserLinkId);
  }

  TagUserLinkTableDriftCompanion _createSelectedTagUserCompanion(int tagId, int userId) {
    return TagUserLinkTableDriftCompanion(
      id: Value.absent(),
      tagId: Value(tagId),
      userId: Value(userId),
      linkingDate: Value(DateTime.now()),
    );
  }
}
