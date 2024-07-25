import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

abstract class UserRepository {
  Future<Either<Failure, int>> insertUser(UserEntity user);

  Future<Either<Failure, bool>> updateUser(UserEntity user);

  Future<Either<Failure, int>> deleteUser(int userId);

  Future<Either<Failure, UserEntity>> getUserById(int id);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsAll();

  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(
      IdSet idSet);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByUserId(
      int userId);

  Future<Either<Failure, int>> addUserToUser(int userLinkedId, int userId);

  Future<Either<Failure, int>> deleteUserFromUser(int userLinkedId, int userId);

  Future<Either<Failure, UserEntity>> getUserByEmailAndPassword(
      String email, String password);
}
