import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class TagLocalDataSourceDrift implements TagLocalDataSource {
  final TagDaoDrift tagDaoDrift;

  TagLocalDataSourceDrift({required this.tagDaoDrift});

  @override
  Future<int> insertTag(TagEntity tag) async {
    // Convert TagEntity to TagTableDriftCompanion before inserting
    final tagCompanion = TagMapper.tableDriftCompanionFromEntity(tag);
    return await tagDaoDrift.insertTag(tagCompanion);
  }

  @override
  Future<bool> updateTag(TagEntity tag) async {
    final tagCompanion = TagMapper.tableDriftCompanionFromEntity(tag);
    return await tagDaoDrift.updateTag(tagCompanion);
  }

  @override
  Future<int> deleteTag(int tagId) async {
    return await tagDaoDrift.deleteTag(tagId);
  }

  @override
  Future<TagEntity> getTagById(int id) async {
    final tag = await tagDaoDrift.getTagById(id);
    return tag != null
        ? TagMapper.entityFromTableDrift(tag)
        : TagEntity.empty();
  }

  @override
  Future<OrganizerItems<TagEntity>> getTagItemsAll() async {
    final tags = await tagDaoDrift.getTagItemsAll();
    return TagMapper.modelItemsFromTableDriftItems(tags);
  }

  @override
  Future<OrganizerItems<TagEntity>> getTagItemsByIdSet(IdSet idSet) async {
    final tags = await tagDaoDrift.getTagItemsByTagIdSet(idSet.toSet());
    return TagMapper.modelItemsFromTableDriftItems(tags);
  }
}
