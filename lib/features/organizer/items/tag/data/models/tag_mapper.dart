import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class TagMapper {
  static TagModel modelFromTableDrift(TagTableDriftG tag) {
    return TagModel(
      id: tag.id,
      subject: tag.subject,
    );
  }

  static OrganizerItems<TagModel> modelItemsFromTableDriftItems(
      List<TagTableDriftG>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromTableDrift).toList());
  }

  static TagModel modelFromEntity(TagEntity? tagEntity) {
    if (tagEntity == null) {
      return TagModel.empty();
    }
    return TagModel(
      id: tagEntity.id,
      subject: tagEntity.subject,
    );
  }

  static OrganizerItems<TagModel> modelItemsFromEntityItems(
      OrganizerItems<TagEntity>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(modelFromEntity).toList());
  }

  static TagEntity entityFromModel(TagModel model) {
    return TagEntity(
      id: model.id,
      subject: model.subject,
    );
  }

  static TagModel entityFromTableDrift(TagTableDriftG tag) {
    return TagModel(
      id: tag.id,
      subject: tag.subject,
    );
  }

  static OrganizerItems<TagEntity> entityItemsFromTableDriftItems(
      List<TagTableDriftG>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static OrganizerItems<TagEntity> entityItemsFromModelItems(
      OrganizerItems<TagModel>? items) {
    if (items == null) {
      return OrganizerItems.empty();
    }
    return OrganizerItems.of(items.map(entityFromModel).toList());
  }

  static TagTableDriftCompanion tableDriftCompanionFromModel(TagModel model) {
    return TagTableDriftCompanion(
      id: Value(model.id),
      subject: Value(model.subject),
    );
  }

  static TagTableDriftCompanion entityToCompanion(TagEntity entity) {
    return TagTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      subject: Value(entity.subject),
    );
  }
}
