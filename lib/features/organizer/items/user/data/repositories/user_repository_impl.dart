import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, int>> addUserToUser(int userLinkedId, int userId) {
    // TODO: implement addUserToUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteUser(int userId) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteUserFromUser(
      int userLinkedId, int userId) {
    // TODO: implement deleteUserFromUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsAll() {
    // TODO: implement getUserItemsAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(
      IdSet idSet) {
    // TODO: implement getUserItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByUserId(
      int userId) {
    // TODO: implement getUserItemsByUserId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> addUser(UserEntity user) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateUser(UserEntity user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmailAndPassword(
      String email, String password) {
    // TODO: implement getUserByEmailAndPassword
    throw UnimplementedError();
  }
}
