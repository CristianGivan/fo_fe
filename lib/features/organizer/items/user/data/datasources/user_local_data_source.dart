import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

abstract class UserLocalDataSource {
  Future<int> addUser(UserTableDriftCompanion userCompanion);

  Future<bool> updateUser(UserTableDriftCompanion userCompanion);

  Future<int> deleteUser(int userId);

  Future<UserTableDriftG?> getUserById(int id);

  Future<List<UserTableDriftG>?> getUserItemsAll();

  Future<List<UserTableDriftG?>?> getUserItemsByIdSet(IdSet idSet);

  Future<List<UserTableDriftG?>?> getUserItemsByUserId(int userId);

  Future<int> addUserToUser(int userLinkedId, int userId);

  Future<int> deleteUserFromUser(int userLinkedId, int userId);

  Future<UserTableDriftG?> getUserByEmailAndPassword(
      String email, String password);
}
