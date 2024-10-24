// user_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

import '../../../../../../core/db/drift/organizer_drift_exports.dart';

class UserLocalDataSourceDrift implements UserLocalDataSource {
  final OrganizerDriftDB db;

  UserLocalDataSourceDrift({
    required this.db,
  });

  @override
  Future<int> addUser(UserTableDriftCompanion userCompanion) {
    return db.userDaoDrift.addUser(userCompanion);
  }

  @override
  Future<bool> updateUser(UserTableDriftCompanion userCompanion) {
    return db.userDaoDrift.updateUser(userCompanion);
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
        .addUserUser(_createUserUserCompanion(userLinkedId, userId));
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
