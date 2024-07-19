import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class UserRepositoryDrift implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryDrift(this.localDataSource);

  @override
  Future<Either<Failure, int>> insertUser(UserEntity user) async {
    try {
      final companion = UserMapper.entityToCompanion(user);
      final result = await localDataSource.insertUser(companion);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser(UserEntity user) async {
    try {
      final companion = UserMapper.entityToCompanion(user);
      final result = await localDataSource.updateUser(companion);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteUser(int userId) async {
    try {
      final result = await localDataSource.deleteUser(userId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getUserById(int id) async {
    try {
      final result = await localDataSource.getUserById(id);
      return Right(UserMapper.modelToEntity(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsAll() async {
    try {
      final result = await localDataSource.getUserItemsAll();
      return Right(UserMapper.entityItemsToModelItems(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(
      IdSet idSet) async {
    try {
      final result = await localDataSource.getUserItemsByIdSet(idSet);
      return Right(UserMapper.entityItemsToModelItems(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByUserId(
      int userId) async {
    try {
      final result = await localDataSource.getUserItemsByUserId(userId);
      return Right(UserMapper.entityItemsToModelItems(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> addUserToUser(
      int userLinkedId, int userId) async {
    try {
      final result = await localDataSource.addUserToUser(userLinkedId, userId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteUserFromUser(
      int userLinkedId, int userId) async {
    try {
      final result =
          await localDataSource.deleteUserFromUser(userLinkedId, userId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }
}
