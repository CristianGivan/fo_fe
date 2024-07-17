import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

abstract class UserLocalDataSource {
  Future<int> insertUser(UserTableDriftCompanion user);

  Future<bool> updateUser(UserTableDriftCompanion user);

  Future<int> deleteUser(int userId);

  Future<UserModel?> getUserById(int id);

  Future<List<UserModel>> getUserItemsAll();

  Future<List<UserModel>> getUserItemsByIdSet(IdSet idSet);

  Future<List<UserModel>> getUserItemsByUserId(int userId);

  Future<int> addUserToUser(int userLinkedId, int userId);

  Future<int> deleteUserFromUser(int userLinkedId, int userId);
}
