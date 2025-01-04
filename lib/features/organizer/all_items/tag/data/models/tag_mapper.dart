import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagMapper {
  static TagEntity entityFromTableDrift(TagTableDriftG tag) {
    return TagEntity(
      id: tag.id,
      subject: tag.subject,
    );
  }

  static OrganizerItems<TagEntity> entityItemsFromTableDriftItems(List<TagTableDriftG> items) {
    return OrganizerItems.of(items.map(entityFromTableDrift).toList());
  }

  static TagTableDriftCompanion tableDriftCompanionFromEntity(TagEntity entity) {
    return TagTableDriftCompanion(
      id: Value(entity.id),
      subject: Value(entity.subject),
    );
  }

  static TagTableDriftCompanion entityToCompanion(TagEntity entity) {
    return TagTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      remoteId: Value(entity.remoteId),
      lastUpdate: Value(entity.lastUpdate),
      lastViewedDate: Value(entity.lastViewedDate),
      remoteViews: Value(entity.remoteViews),
      views: Value(entity.views),
      checksum: Value(entity.checksum),
      subject: Value(entity.subject),
    );
  }
}
