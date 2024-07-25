import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';

abstract class TagLocalDataSource {
  Future<int> insertTag(TagEntity tag);

  Future<bool> updateTag(TagEntity tag);

  Future<int> deleteTag(int tagId);

  Future<TagEntity?> getTagById(int id);

  Future<OrganizerItems<TagEntity>> getTagItemsAll();

  Future<OrganizerItems<TagEntity>> getTagItemsByIdSet(IdSet idSet);
}
