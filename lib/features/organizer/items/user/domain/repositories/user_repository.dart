import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class UserRepository {
  Future<Either<Failure, int>> addUser(UserEntity user);

  Future<Either<Failure, bool>> updateUser(UserEntity user);

  Future<Either<Failure, int>> deleteUser(int userId);

  Future<Either<Failure, UserEntity>> getUserById(int id);

  // Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsAll();

  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(IdSet idSet);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getConnectedUserItemsByUserId(int userId);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getPendingInvitations(int userId);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getSendInvitations(int userId);

  Future<Either<Failure, int>> addUserToUser(int userLinkedId, int userId);

  Future<Either<Failure, int>> deleteUserFromUser(int userLinkedId, int userId);

  Future<Either<Failure, UserEntity>> getUserByEmailAndPassword(String email, String password);
}
