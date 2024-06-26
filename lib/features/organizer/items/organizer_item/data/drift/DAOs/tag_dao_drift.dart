import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift_sqlite/organizer_drift_db.dart';

import '../tables/tag_table_drift.dart';

part 'tag_dao_drift.g.dart';

@DriftAccessor(tables: [TagTableDrift])
class TagDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TagDaoMixin {
  final OrganizerDriftDB db;

  TagDaoDrift(this.db) : super(db);

  Future<List<TagTableDriftG>> getAllTags() => select(tagTableDrift).get();

  Stream<List<TagTableDriftG>> watchAllTags() => select(tagTableDrift).watch();

  Future<int> insertTag(Insertable<TagTableDriftG> tag) =>
      into(tagTableDrift).insert(tag);

  Future<bool> updateTag(Insertable<TagTableDriftG> tag) =>
      update(tagTableDrift).replace(tag);

  Future<int> deleteTag(Insertable<TagTableDriftG> tag) =>
      delete(tagTableDrift).delete(tag);
}
