import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'tag_dao_drift.g.dart';

@DriftAccessor(tables: [TagTableDrift])
class TagDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TagDaoDriftMixin {
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

  Future<List<TagTableDriftG>> getTagItemsByTagIds(Set<int> tagIds) async {
    return (select(tagTableDrift)..where((tbl) => tbl.id.isIn(tagIds))).get();
  }
}
