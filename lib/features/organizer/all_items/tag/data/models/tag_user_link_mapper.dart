import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_user_entity.dart';

class TagUserLinkMapper {
  static TagUserLinkEntity entityFromTableDrift(TagUserLinkTableDriftG table) {
    return TagUserLinkEntity(
      id: table.id,
      linkingDate: table.linkingDate,
      tagId: table.tagId,
      userId: table.userId,
      selectedByUser: table.selectedByUser ?? false,
      orderedByUser: table.orderedByUser ?? 0,
    );
  }

  static TagUserLinkTableDriftCompanion companionFromEntity(TagUserLinkEntity entity) {
    return TagUserLinkTableDriftCompanion(
      id: entity.id == 0 ? const Value.absent() : Value(entity.id),
      linkingDate: Value(entity.linkingDate ?? DateTime.now()),
      tagId: Value(entity.tagId ?? 0),
      userId: Value(entity.userId ?? 0),
      selectedByUser: Value(entity.isSelectedByUser ?? false),
      orderedByUser: Value(entity.orderedByUser),
    );
  }

  TagUserLinkTableDriftCompanion _createSelectedTagUserCompanion(int tagId, int userId) {
    return TagUserLinkTableDriftCompanion(
      tagId: Value(tagId),
      userId: Value(userId),
      linkingDate: Value(DateTime.now()),
      selectedByUser: Value(true),
    );
  }

  static TagUserLinkTableDriftCompanion entityToCompanion(TagUserLinkEntity tagUserLink) {
    return TagUserLinkTableDriftCompanion(
      id: tagUserLink.id == 0 ? const Value.absent() : Value(tagUserLink.id),
      linkingDate: Value(tagUserLink.linkingDate ?? DateTime.now()),
      tagId: Value(tagUserLink.tagId ?? 0),
      userId: Value(tagUserLink.userId ?? 0),
      selectedByUser: Value(tagUserLink.isSelectedByUser ?? false),
      orderedByUser: Value(tagUserLink.orderedByUser),
    );
  }

  static TagUserLinkEntity rowToTagUserEntity(QueryRow row) {
    return TagUserLinkEntity(
      id: row.read<int>('id'),
      linkingDate: row.read<DateTime>('linking_date'),
      tagId: row.read<int>('tag_id'),
      userId: row.read<int>('user_id'),
      selectedByUser: row.read<bool>('selected_by_user'),
      orderedByUser: row.read<int>('ordered_by_user'),
    );
  }
}
