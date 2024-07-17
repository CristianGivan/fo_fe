// user_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/features/organizer/items/user/data/datasources/user_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

import '../../../../../../core/db/drift/organizer_drift_exports.dart';

class UserLocalDataSourceDrift implements UserLocalDataSource {
  final UserDaoDrift userDao;
  final UserUserDaoDrift userUserDao;

  UserLocalDataSourceDrift({
    required this.userDao,
    required this.userUserDao,
  });

  Future<int> insertUser(UserTableDriftCompanion user) {
    return userDao.insertUser(user);
  }

  Future<bool> updateUser(UserTableDriftCompanion user) {
    return userDao.updateUser(user);
  }

  Future<int> deleteUser(int userId) {
    return userDao.deleteUser(userId);
  }

  Future<UserModel?> getUserById(int id) async {
    final userTable = await userDao.getUserById(id);
    return userTable != null ? UserMapper.modelFromTableDrift(userTable) : null;
  }

  // Get all user items
  Future<List<UserModel>> getUserItemsAll() async {
    final userTables = await userDao.getUserItemsAll();
    return userTables.map(UserMapper.modelFromTableDrift).toList();
  }

  // Get user items by ID set
  Future<List<UserModel>> getUserItemsByIdSet(IdSet idSet) async {
    final userTables = await userDao.getUserItemsByIdSet(idSet);
    return userTables.map(UserMapper.modelFromTableDrift).toList();
  }

  Future<List<UserModel>> getUserItemsByUserId(int userId) async {
    final userIds = await userUserDao.getUserIdsByUserId(userId);
    final userTables = await userDao.getUserListByUserIds(userIds);
    return userTables.map(UserMapper.modelFromTableDrift).toList();
  }

  Future<int> addUserToUser(int userLinkedId, int userId) async {
    return userUserDao
        .insertUserUser(_createUserUserCompanion(userLinkedId, userId));
  }

  Future<int> deleteUserFromUser(int userLinkedId, int userId) async {
    return userUserDao.deleteUserUser(userLinkedId, userId);
  }

  UserTagTableDriftCompanion _createUserTagCompanion(int userId, int tagId) {
    return UserTagTableDriftCompanion(
      userId: Value(userId),
      tagId: Value(tagId),
    );
  }

  UserReminderTableDriftCompanion _createUserReminderCompanion(
      int userId, int reminderId) {
    return UserReminderTableDriftCompanion(
      userId: Value(userId),
      reminderId: Value(reminderId),
    );
  }

  UserUserTableDriftCompanion _createUserUserCompanion(
      int userLinkedId, int userId) {
    return UserUserTableDriftCompanion(
      userLinkedId: Value(userLinkedId),
      userId: Value(userId),
    );
  }
}
