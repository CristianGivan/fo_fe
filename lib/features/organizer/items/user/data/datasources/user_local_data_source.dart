import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class UserLocalDataSource {
  Future<int> addUser(UserTableDriftCompanion userCompanion);

  Future<bool> updateUser(UserTableDriftCompanion userCompanion);

  Future<int> deleteUser(int userId);

  Future<UserTableDriftG?> getUserById(int id);

  Future<int> addUserToUser(int userLinkedId, int userId);

  Future<bool> updateUserUser(int userLinkedId, int userId);

  Future<int> deleteUserFromUser(int userLinkedId, int userId);

  Future<UserTableDriftG?> getUserByEmailAndPassword(String email, String password);

  Future<UserTableDriftG?> getUserByEmail(String email);

  Future<UserTableDriftG?> getUserByName(String name);

  Future<List<UserTableDriftG?>?> getUserItemsByIdSet(IdSet idSet);

  Future<List<UserTableDriftG?>?> getConnectedUserIdsByUserId(int userId);

  Future<List<UserTableDriftG?>?> getPendingInvitations(int userId);

  Future<List<UserTableDriftG?>?> getSendInvitations(int userId);

// Future<List<UserTableDriftG>?> getUserItemsAll();
}
