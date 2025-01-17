import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'tag_dao_drift.g.dart';

@DriftAccessor(tables: [TagTableDrift])
class TagDaoDrift extends DatabaseAccessor<OrganizerDriftDB> with _$TagDaoDriftMixin {
  final OrganizerDriftDB db;

  TagDaoDrift(this.db) : super(db);

  Future<TagTableDriftG?> getTagById(int id) =>
      (select(tagTableDrift)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<List<TagTableDriftG>> getTagItemsAll() => select(tagTableDrift).get();

  Future<List<TagTableDriftG?>?> getTagItemsByIdSet(Set<int> ids) =>
      (select(tagTableDrift)..where((tbl) => tbl.id.isIn(ids))).get();

  Stream<List<TagTableDriftG>> watchTagItemsAll() => select(tagTableDrift).watch();

  Future<int> addTag(Insertable<TagTableDriftG> tag) => into(tagTableDrift).insert(tag);

  Future<bool> updateTag(Insertable<TagTableDriftG> tag) => update(tagTableDrift).replace(tag);

  Future<int> deleteTag(int id) => (delete(tagTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<QueryRow>?> getTagItemsFromUser(int userId) async {
    final query = customSelect(
      'SELECT tag_table_drift.*, tag_user_link_table_drift.* '
      'FROM tag_table_drift '
      'LEFT OUTER JOIN tag_user_link_table_drift '
      'ON tag_user_link_table_drift.tag_id = tag_table_drift.id '
      'WHERE tag_user_link_table_drift.user_id = ?',
      variables: [Variable.withInt(userId)],
    );

    final result = await query.get();
    return result;
  }
}
