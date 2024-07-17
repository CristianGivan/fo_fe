import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';

class TagMapper {
  static TagModel modelFromTableDrift(TagTableDriftG tag) {
    return TagModel(
      id: tag.id,
      name: tag.name,
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

  static OrganizerItems<TagModel> entityListToModelList(
      List<TagEntity>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(entityToModel).toList());
  }

  static TagEntity modelToEntity(TagModel model) {
    return TagEntity(
      id: model.id,
      name: model.name,
    );
  }

  static List<TagEntity> modelListToEntityList(List<TagModel>? tagModelList) {
    if (tagModelList == null) {
      return [];
    }
    return tagModelList.map(modelToEntity).toList();
  }

  static TagTableDriftCompanion toCompanion(TagModel tag) {
    return TagTableDriftCompanion(
      id: Value(tag.id),
      name: Value(tag.name),
    );
  }
}
