import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class TagLocalDataSourceDrift implements TagLocalDataSource {
  final OrganizerDriftDB db;

  TagLocalDataSourceDrift({required this.db});

  @override
  Future<int> insertTag(TagEntity tag) async {
    // Convert TagEntity to TagTableDriftCompanion before inserting
    final tagCompanion = TagMapper.tableDriftCompanionFromEntity(tag);
    return await db.tagDaoDrift.insertTag(tagCompanion);
  }

  @override
  Future<bool> updateTag(TagEntity tag) async {
    final tagCompanion = TagMapper.tableDriftCompanionFromEntity(tag);
    return await db.tagDaoDrift.updateTag(tagCompanion);
  }

  @override
  Future<int> deleteTag(int tagId) async {
    return await db.tagDaoDrift.deleteTag(tagId);
  }

  @override
  Future<TagEntity> getTagById(int id) async {
    final tag = await db.tagDaoDrift.getTagById(id);
    return tag != null
        ? TagMapper.entityFromTableDrift(tag)
        : TagEntity.empty();
  }

  @override
  Future<OrganizerItems<TagEntity>> getTagItemsAll() async {
    final tags = await db.tagDaoDrift.getTagItemsAll();
    return TagMapper.modelItemsFromTableDriftItems(tags);
  }

  @override
  Future<OrganizerItems<TagEntity>> getTagItemsByIdSet(IdSet idSet) async {
    final tags = await db.tagDaoDrift.getTagItemsByTagIdSet(idSet.toSet());
    return TagMapper.modelItemsFromTableDriftItems(tags);
  }
}
