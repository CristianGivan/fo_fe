import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

part 'user_dao_drift.g.dart';

@DriftAccessor(tables: [UserTableDrift, UserUserTableDrift])
class UserDaoDrift extends DatabaseAccessor<OrganizerDriftDB> with _$UserDaoDriftMixin {
  final OrganizerDriftDB db;

  UserDaoDrift(this.db) : super(db);

  Future<UserTableDriftG?> getUserById(int id) =>
      (select(userTableDrift)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  // Future<List<UserTableDriftG>> getUserItemsAll() => select(userTableDrift).get();

  // Stream<List<UserTableDriftG>> watchAllUsers() => select(userTableDrift).watch();

  Future<List<UserTableDriftG?>?> getUserItemsByIdSet(Set<int> ids) async {
    return (select(userTableDrift)..where((tbl) => tbl.id.isIn(ids))).get();
  }

  Future<int> addUser(Insertable<UserTableDriftG> user) => into(userTableDrift).insert(user);

  Future<bool> updateUser(Insertable<UserTableDriftG> user) => update(userTableDrift).replace(user);

  Future<int> deleteUser(int id) =>
      (delete(userTableDrift)..where((tbl) => tbl.id.equals(id))).go();

  Future<UserTableDriftG?> getUserByEmailAndPassword(String email, String hashedPassword) async {
    final query = select(userTableDrift)
      ..where((u) => u.email.equals(email) & u.hashedPassword.equals(hashedPassword));
    return await query.getSingleOrNull();
  }

  Future<UserTableDriftG?> getUserByEmail(String email) async {
    final query = select(userTableDrift)..where((u) => u.email.equals(email));
    return await query.getSingleOrNull();
  }

  Future<UserTableDriftG?> getUserByName(String name) async {
    final query = select(userTableDrift)..where((u) => u.name.equals(name));
    return await query.getSingleOrNull();
  }

  Future<List<UserTableDriftG>> getPendingAndAcceptedUsers(int userId) {
    final query = customSelect(
      'SELECT user_table_drift.*, user_user_table_drift.* '
      'FROM user_user_table_drift '
      'JOIN user_table_drift ON user_user_table_drift.user_id = user_table_drift.id '
      'WHERE user_user_table_drift.user_id = ? AND (user_user_table_drift.status = ? OR user_user_table_drift.status = ?)',
      variables: [
        Variable.withInt(userId),
        Variable.withString('PENDING'),
        Variable.withString('ACCEPTED'),
      ],
      readsFrom: {userUserTableDrift, userTableDrift},
    );

    return query.map((row) {
      return UserMapper.fromUserJoinUserUser(row.data, db);
    }).get();
  }
}
