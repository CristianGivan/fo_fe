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

  @override
  Future<int> insertUser(UserTableDriftCompanion user) {
    return db.userDaoDrift.insertUser(user);
  }

  @override
  Future<bool> updateUser(UserTableDriftCompanion user) {
    return db.userDaoDrift.updateUser(user);
  }

  @override
  Future<int> deleteUser(int userId) {
    return db.userDaoDrift.deleteUser(userId);
  }

  @override
  Future<UserTableDriftG?> getUserById(int id) async {
    return await db.userDaoDrift.getUserById(id);
  }

  // Get all user items
  @override
  Future<List<UserTableDriftG>?> getUserItemsAll() async {
    return await db.userDaoDrift.getUserItemsAll();
  }

  // Get user items by ID set
  @override
  Future<List<UserTableDriftG?>?> getUserItemsByIdSet(IdSet idSet) async {
    return await db.userDaoDrift.getUserItemsByIdSet(idSet.toSet());
  }

  @override
  Future<List<UserTableDriftG?>?> getUserItemsByUserId(int userId) async {
    final userIds = await db.userUserDaoDrift.getUserIdsByUserId(userId);
    return await db.userDaoDrift.getUserItemsByIdSet(userIds);
  }

  @override
  Future<int> addUserToUser(int userLinkedId, int userId) async {
    return db.userUserDaoDrift
        .insertUserUser(_createUserUserCompanion(userLinkedId, userId));
  }

  @override
  Future<int> deleteUserFromUser(int userLinkedId, int userId) async {
    return db.userUserDaoDrift.deleteUserUser(userLinkedId, userId);
  }

  @override
  Future<UserTableDriftG?> getUserByEmailAndPassword(
      String email, String password) async {
    return await db.userDaoDrift.getUserByEmailAndPassword(email, password);
  }

  UserUserTableDriftCompanion _createUserUserCompanion(
      int userLinkedId, int userId) {
    return UserUserTableDriftCompanion(
      userLinkedId: Value(userLinkedId),
      userId: Value(userId),
    );
  }
}
