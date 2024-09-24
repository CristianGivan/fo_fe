import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'tag_dao_drift.g.dart';

@DriftAccessor(tables: [TagTableDrift])
class TagDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TagDaoDriftMixin {
  final OrganizerDriftDB db;

  TagDaoDrift(this.db) : super(db);

  Future<TagTableDriftG?> getTagById(int id) =>
      (select(tagTableDrift)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<List<TagTableDriftG>> getTagItemsAll() => select(tagTableDrift).get();

  Stream<List<TagTableDriftG>> watchAllTags() => select(tagTableDrift).watch();

  Future<int> addTag(Insertable<TagTableDriftG> tag) =>
      into(tagTableDrift).insert(tag);

  Future<bool> updateTag(Insertable<TagTableDriftG> tag) =>
      update(tagTableDrift).replace(tag);

  Future<int> deleteTag(int id) =>
      (delete(tagTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<TagTableDriftG>> getTagItemsByTagIdSet(Set<int> tagIds) async {
    return (select(tagTableDrift)..where((tbl) => tbl.id.isIn(tagIds))).get();
  }
}
