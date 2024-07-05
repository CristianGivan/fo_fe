import 'package:drift/drift.dart';

import '../../organizer_drift_exports.dart';

part 'user_dao_drift.g.dart';

@DriftAccessor(tables: [UserTableDrift])
class UserDaoDrift extends DatabaseAccessor<OrganizerDriftDB>
    with _$UserDaoDriftMixin {
  final OrganizerDriftDB db;

  UserDaoDrift(this.db) : super(db);

  Future<UserTableDriftG?> getUserById(int id) =>
      (select(userTableDrift)..where((tbl) => tbl.id.equals(id)))
          .getSingleOrNull();

  Future<List<UserTableDriftG>> getAllUsers() => select(userTableDrift).get();

  Stream<List<UserTableDriftG>> watchAllUsers() =>
      select(userTableDrift).watch();

  Future<int> insertUser(Insertable<UserTableDriftG> user) =>
      into(userTableDrift).insert(user);

  Future<bool> updateUser(Insertable<UserTableDriftG> user) =>
      update(userTableDrift).replace(user);

  Future<int> deleteUser(Insertable<UserTableDriftG> user) =>
      delete(userTableDrift).delete(user);

  Future<List<UserTableDriftG>> getUserListByUserIds(List<int> userIds) async {
    return (select(userTableDrift)..where((tbl) => tbl.id.isIn(userIds))).get();
  }
}
