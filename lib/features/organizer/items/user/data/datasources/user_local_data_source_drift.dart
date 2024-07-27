// user_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

import '../../../../../../core/db/drift/organizer_drift_exports.dart';

class UserLocalDataSourceDrift implements UserLocalDataSource {
  final OrganizerDriftDB db;

  UserLocalDataSourceDrift({
    required this.db,
  });

  Future<int> insertUser(UserTableDriftCompanion user) {
    return db.userDaoDrift.insertUser(user);
  }

  Future<bool> updateUser(UserTableDriftCompanion user) {
    return db.userDaoDrift.updateUser(user);
  }

  Future<int> deleteUser(int userId) {
    return db.userDaoDrift.deleteUser(userId);
  }

  Future<UserModel> getUserById(int id) async {
    final userTable = await db.userDaoDrift.getUserById(id);
    return userTable != null
        ? UserMapper.modelFromTableDrift(userTable)
        : UserModel.empty();
  }

  // Get all user items
  Future<OrganizerItems<UserModel>> getUserItemsAll() async {
    final items = await db.userDaoDrift.getUserItemsAll();
    return UserMapper.modelItemsFromTableDriftItems(items);
  }

  // Get user items by ID set
  Future<OrganizerItems<UserModel>> getUserItemsByIdSet(IdSet idSet) async {
    final userTables = await db.userDaoDrift.getUserItemsByIdSet(idSet.toSet());
    return UserMapper.modelItemsFromTableDriftItems(userTables);
  }

  Future<OrganizerItems<UserModel>> getUserItemsByUserId(int userId) async {
    final userIds = await db.userUserDaoDrift.getUserIdsByUserId(userId);
    final userTables = await db.userDaoDrift.getUserItemsByIdSet(userIds);
    return UserMapper.modelItemsFromTableDriftItems(userTables);
  }

  Future<int> addUserToUser(int userLinkedId, int userId) async {
    return db.userUserDaoDrift
        .insertUserUser(_createUserUserCompanion(userLinkedId, userId));
  }

  Future<int> deleteUserFromUser(int userLinkedId, int userId) async {
    return db.userUserDaoDrift.deleteUserUser(userLinkedId, userId);
  }

  UserUserTableDriftCompanion _createUserUserCompanion(
      int userLinkedId, int userId) {
    return UserUserTableDriftCompanion(
      userLinkedId: Value(userLinkedId),
      userId: Value(userId),
    );
  }

  @override
  Future<UserModel> getUserByEmailAndPassword(
      String email, String password) async {
    final userTable =
        await db.userDaoDrift.getUserByEmailAndPassword(email, password);
    return userTable != null
        ? UserMapper.modelFromTableDrift(userTable)
        : UserModel.empty();
  }
}
