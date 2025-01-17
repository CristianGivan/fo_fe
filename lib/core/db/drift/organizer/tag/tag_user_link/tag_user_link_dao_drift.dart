import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer/tag/tag_user_link/tag_user_link_table_drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'tag_user_link_dao_drift.g.dart';

@DriftAccessor(tables: [TagUserLinkTableDrift])
class TagUserLinkDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$TagUserLinkDaoDriftMixin {
  final OrganizerDriftDB db;

  TagUserLinkDaoDrift(this.db) : super(db);

  Future<List<TagUserLinkTableDriftG>> getAllTagUsers() => select(tagUserLinkTableDrift).get();

  Stream<List<TagUserLinkTableDriftG>> watchAllTagUsers() => select(tagUserLinkTableDrift).watch();

  Future<int> addTagUser(Insertable<TagUserLinkTableDriftG> tagUser) =>
      into(tagUserLinkTableDrift).insert(tagUser);

  Future<bool> updateTagUserLink(Insertable<TagUserLinkTableDriftG> tagUser) =>
      update(tagUserLinkTableDrift).replace(tagUser);

  Future<int> deleteTagUserByTagId(int tagId) async {
    return (delete(tagUserLinkTableDrift)..where((tbl) => tbl.tagId.equals(tagId))).go();
  }

  Future<int> deleteTagUser(int tagId, int userId) async {
    return (delete(tagUserLinkTableDrift)
          ..where((tbl) => tbl.tagId.equals(tagId) & tbl.userId.equals(userId)))
        .go();
  }

  Future<Set<int>> getUserIdsByTagId(int tagId) async {
    final result =
        await (select(tagUserLinkTableDrift)..where((tbl) => tbl.tagId.equals(tagId))).get();
    return result.map((row) => row.userId).toSet();
  }

  Future<Set<int>> getTagIdsByUserId(int userId) async {
    final result =
        await (select(tagUserLinkTableDrift)..where((tbl) => tbl.userId.equals(userId))).get();
    return result.map((row) => row.tagId).toSet();
  }

  Future<TagUserLinkTableDriftG?> getTagUserById(int id) async {
    return await (select(tagUserLinkTableDrift)..where((tbl) => tbl.id.equals(id))).getSingle();
  }
}
