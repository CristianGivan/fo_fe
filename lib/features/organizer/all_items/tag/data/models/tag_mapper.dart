import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/data/models/tag_user_link_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagMapper {
  static TagEntity entityFromTableDrift(TagTableDriftG tag) {
    return TagEntity(
      id: tag.id,
      subject: tag.subject,
      createdDate: tag.createdDate,
      creatorId: tag.creatorId,
      remoteId: tag.remoteId,
      lastUpdate: tag.lastUpdate,
      lastViewedDate: tag.lastViewedDate,
      remoteViews: tag.remoteViews,
      views: tag.views,
      checksum: tag.checksum,
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
      subject: Value(entity.subject),
      createdDate: Value(entity.createdDate),
      creatorId: Value(entity.creatorId),
      remoteId: Value(entity.remoteId),
      lastUpdate: Value(entity.lastUpdate),
      lastViewedDate: Value(entity.lastViewedDate),
      remoteViews: Value(entity.remoteViews),
      views: Value(entity.views),
      checksum: Value(entity.checksum),
    );
  }

  static TagEntity jsonFoApiToModel(Map<String, dynamic> json) {
    return TagEntity(
      id: json['id'],
      subject: json['subject'],
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null,
      creatorId: json['creatorId'],
      remoteId: json['remoteId'],
      lastUpdate: json['lastUpdate'] != null ? DateTime.parse(json['lastUpdate']) : null,
      lastViewedDate:
          json['lastViewedDate'] != null ? DateTime.parse(json['lastViewedDate']) : null,
      remoteViews: json['remoteViews'],
      views: json['views'],
      checksum: json['checksum'],
    );
  }

  static Map<String, dynamic> jsonFromEntity(TagEntity model) {
    return {
      "tagId": model.id,
      "tag": model.subject,
      "createdDate": model.createdDate.toIso8601String(),
      "remoteId": model.remoteId,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
      "lastViewedDate": model.lastViewedDate?.toIso8601String(),
      "remoteViews": model.remoteViews,
      "views": model.views,
      "checksum": model.checksum,
    };
  }

  static Map<String, dynamic> jsonForCheckingTheUpdatesFromEntity(TagEntity model) {
    return {
      "remoteId": model.remoteId,
      "checksum": model.checksum,
      "lastUpdate": model.lastUpdate?.toIso8601String(),
    };
  }

  static OrganizerItems<TagDto> itemsFromRows(List<QueryRow> rows) {
    List<TagDto> items = rows
        .map((row) => TagDto(
              tag: tagEntityFromRow(row),
              tagUserLink: TagUserLinkMapper.rowToTagUserEntity(row),
            ))
        .toList();
    return OrganizerItems.of(items);
  }

  static OrganizerItems<TagEntity> entitiesFromRows(List<QueryRow> rows) {
    List<TagEntity> items = rows.map((row) => tagEntityFromRow(row)).toList();
    return OrganizerItems.of(items);
  }

  static TagEntity tagEntityFromRow(QueryRow row) {
    return TagEntity(
      id: row.read<int>('id'),
      subject: row.read<String>('subject'),
      createdDate: row.read<DateTime>('created_date'),
      creatorId: row.read<int>('creator_id'),
      remoteId: row.read<int>('remote_id'),
      lastUpdate: row.read<DateTime>('last_update'),
      lastViewedDate: row.read<DateTime>('last_viewed_date'),
      remoteViews: row.read<int>('remote_views'),
      views: row.read<int>('views'),
      checksum: row.read<String>('checksum'),
    );
  }
}
