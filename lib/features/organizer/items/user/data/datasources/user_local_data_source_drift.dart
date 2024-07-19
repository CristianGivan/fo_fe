// user_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
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

  Future<UserModel> getUserById(int id) async {
    final userTable = await userDao.getUserById(id);
    return userTable != null
        ? UserMapper.modelFromTableDrift(userTable)
        : UserModel.empty();
  }

  // Get all user items
  Future<OrganizerItems<UserModel>> getUserItemsAll() async {
    final items = await userDao.getUserItemsAll();
    return UserMapper.modelItemsFromTableDriftItems(items);
  }

  // Get user items by ID set
  Future<OrganizerItems<UserModel>> getUserItemsByIdSet(IdSet idSet) async {
    final userTables = await userDao.getUserItemsByIdSet(idSet.toSet());
    return UserMapper.modelItemsFromTableDriftItems(userTables);
  }

  Future<OrganizerItems<UserModel>> getUserItemsByUserId(int userId) async {
    final userIds = await userUserDao.getUserIdsByUserId(userId);
    final userTables = await userDao.getUserItemsByIdSet(userIds);
    return UserMapper.modelItemsFromTableDriftItems(userTables);
  }

  Future<int> addUserToUser(int userLinkedId, int userId) async {
    return userUserDao
        .insertUserUser(_createUserUserCompanion(userLinkedId, userId));
  }

  Future<int> deleteUserFromUser(int userLinkedId, int userId) async {
    return userUserDao.deleteUserUser(userLinkedId, userId);
  }

  UserUserTableDriftCompanion _createUserUserCompanion(
      int userLinkedId, int userId) {
    return UserUserTableDriftCompanion(
      userLinkedId: Value(userLinkedId),
      userId: Value(userId),
    );
  }
}
