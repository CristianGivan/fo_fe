import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

abstract class TagLocalDataSource {
  Future<int> insertTag(TagTableDriftCompanion tagCompanion);

  Future<bool> updateTag(TagTableDriftCompanion tagCompanion);

  Future<int> deleteTag(int tagId);

  Future<TagTableDriftG?> getTagById(int id);

  Future<List<TagTableDriftG>?> getTagItemsAll();

  Future<List<TagTableDriftG?>?> getTagItemsByIdSet(IdSet idSet);
}
