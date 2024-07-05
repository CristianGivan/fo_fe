import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';

class TagMapper {
  static TagModel toModel(TagTableDriftG tagTable) {
    return TagModel(
      id: tagTable.id,
      name: tagTable.name,
    );
  }

  static TagModel entityToModel(TagEntity? tagEntity) {
    if (tagEntity == null) {
      return TagModel.empty();
    }
    return TagModel(
      id: tagEntity.id,
      name: tagEntity.name,
    );
  }

  static TagModel fromTableDrift(TagTableDriftG tag) {
    return TagModel(
      id: tag.id,
      name: tag.name,
    );
  }

  static List<TagModel> entityListToModelList(List<TagEntity>? tagEntityList) {
    if (tagEntityList == null) {
      return [];
    }
    return tagEntityList.map(entityToModel).toList();
  }

  static TagTableDriftCompanion toCompanion(TagModel tag) {
    return TagTableDriftCompanion(
      id: Value(tag.id),
      name: Value(tag.name),
    );
  }
}
