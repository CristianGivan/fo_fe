import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

part 'user_user_dao_drift.g.dart';

@DriftAccessor(tables: [UserUserTableDrift])
class UserUserDaoDrift extends DatabaseAccessor<OrganizerDriftDB> with _$UserUserDaoDriftMixin {
  final OrganizerDriftDB db;

  UserUserDaoDrift(this.db) : super(db);

  Future<int> addUserUser(Insertable<UserUserTableDriftG> userUser) =>
      into(userUserTableDrift).insert(userUser);

  Future<bool> updateUserUser(Insertable<UserUserTableDriftG> userUser) =>
      update(userUserTableDrift).replace(userUser);

  Future<List<UserUserTableDriftG>> getPendingInvitations(int userId) {
    return (select(userUserTableDrift)
          ..where((tbl) => tbl.userLinkedId.equals(userId) & tbl.status.equals('pending')))
        .get();
  }

  Future<List<UserUserTableDriftG>> getSendInvitations(int userId) {
    return (select(userUserTableDrift)
          ..where((tbl) => tbl.userId.equals(userId) & tbl.status.equals('pending')))
        .get();
  }

  Future<List<UserUserTableDriftG>> getConnectedUserIdsByUserId(int userId) async {
    return (select(userUserTableDrift)
          ..where((tbl) =>
              (tbl.userId.equals(userId) | tbl.userLinkedId.equals(userId)) &
              tbl.status.equals('accepted')))
        .get();
  }

  Future<int> deleteUserUser(int userId, int userLinkedId) async {
    return (delete(userUserTableDrift)
          ..where((tbl) => tbl.userId.equals(userId) & tbl.userLinkedId.equals(userId)))
        .go();
  }

// Future<int> deleteUserUserByUserId(int userId) async {
//   return (delete(userUserTableDrift)..where((tbl) => tbl.userId.equals(userId))).go();
// }

// Future<List<UserUserTableDriftG>> getAllUserUsers() => select(userUserTableDrift).get();

// Stream<List<UserUserTableDriftG>> watchAllUserUsers() => select(userUserTableDrift).watch();
}
