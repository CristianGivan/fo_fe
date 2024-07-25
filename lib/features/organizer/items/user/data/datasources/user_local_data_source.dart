import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

abstract class UserLocalDataSource {
  Future<int> insertUser(UserTableDriftCompanion user);

  Future<bool> updateUser(UserTableDriftCompanion user);

  Future<int> deleteUser(int userId);

  Future<UserModel> getUserById(int id);

  Future<OrganizerItems<UserModel>> getUserItemsAll();

  Future<OrganizerItems<UserModel>> getUserItemsByIdSet(IdSet idSet);

  Future<OrganizerItems<UserModel>> getUserItemsByUserId(int userId);

  Future<int> addUserToUser(int userLinkedId, int userId);

  Future<int> deleteUserFromUser(int userLinkedId, int userId);

  Future<UserModel?> getUserByEmailAndPassword(String email, String password);
}
