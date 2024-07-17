import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer/user/user_user_table_drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'user_user_dao_drift.g.dart';

@DriftAccessor(tables: [UserUserTableDrift])
class UserUserDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$UserUserDaoDriftMixin {
  final OrganizerDriftDB db;

  UserUserDaoDrift(this.db) : super(db);

  Future<List<UserUserTableDriftG>> getAllUserUsers() =>
      select(userUserTableDrift).get();

  Stream<List<UserUserTableDriftG>> watchAllUserUsers() =>
      select(userUserTableDrift).watch();

  Future<int> insertUserUser(Insertable<UserUserTableDriftG> userUser) =>
      into(userUserTableDrift).insert(userUser);

  Future<bool> updateUserUser(Insertable<UserUserTableDriftG> userUser) =>
      update(userUserTableDrift).replace(userUser);

  Future<int> deleteUserUserByUserId(int userId) async {
    return (delete(userUserTableDrift)
          ..where((tbl) => tbl.userId.equals(userId)))
        .go();
  }

  Future<int> deleteUserUser(int userId, int userLinkedId) async {
    return (delete(userUserTableDrift)
          ..where((tbl) =>
              tbl.userId.equals(userId) & tbl.userLinkedId.equals(userId)))
        .go();
  }

  Future<List<int>> getUserIdsByUserId(int userId) async {
    final result = await (select(userUserTableDrift)
          ..where((tbl) => tbl.userId.equals(userId)))
        .get();
    return result.map((row) => row.userId).toList();
  }
}
