import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class UserRepositoryDrift implements UserRepository {
  final UserLocalDataSourceDrift localDataSourceDrift;

  UserRepositoryDrift({required this.localDataSourceDrift});

  @override
  Future<Either<Failure, int>> insertUser(UserEntity user) async {
    try {
      final companion = UserMapper.tableDriftCompanionFromEntity(user);
      final result = await localDataSourceDrift.insertUser(companion);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser(UserEntity user) async {
    try {
      final companion = UserMapper.tableDriftCompanionFromEntity(user);
      final result = await localDataSourceDrift.updateUser(companion);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> deleteUser(int userId) async {
    try {
      final result = await localDataSourceDrift.deleteUser(userId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int id) async {
    try {
      final result = await localDataSourceDrift.getUserById(id);
      return Right(UserMapper.entityFromModel(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsAll() async {
    try {
      final result = await localDataSourceDrift.getUserItemsAll();
      return Right(UserMapper.modelItemsFromEntityItems(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(
      IdSet idSet) async {
    try {
      final result = await localDataSourceDrift.getUserItemsByIdSet(idSet);
      return Right(UserMapper.modelItemsFromEntityItems(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByUserId(
      int userId) async {
    try {
      final result = await localDataSourceDrift.getUserItemsByUserId(userId);
      return Right(UserMapper.modelItemsFromEntityItems(result));
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, int>> addUserToUser(
      int userLinkedId, int userId) async {
    try {
      final result =
          await localDataSourceDrift.addUserToUser(userLinkedId, userId);
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
          await localDataSourceDrift.deleteUserFromUser(userLinkedId, userId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmailAndPassword(
      String email, String password) async {
    try {
      final user =
          await localDataSourceDrift.getUserByEmailAndPassword(email, password);
      return Right(UserMapper.entityFromModel(user));
    } catch (e) {
      return Left(CacheFailure("CacheFailure"));
    }
  }
}
