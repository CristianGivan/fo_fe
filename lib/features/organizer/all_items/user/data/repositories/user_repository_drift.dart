import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserRepositoryDrift implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryDrift({required this.localDataSource});

  @override
  Future<Either<Failure, UserEntity>> addUser(UserEntity user) async {
    return _executeDatabaseOperation(() async {
      final companion = UserMapper.entityToCompanion(user);
      if (user.email != "") {
        return await returnExistingUserWithMailOrAddedUser(user, companion);
      } else if (user.name != "") {
        return await checkUserWithNameAndAddUser(user, companion);
      } else {
        return _addUserOrThrow(companion);
      }
    });
  }

  checkUserWithNameAndAddUser(UserEntity user, UserTableDriftCompanion companion) async {
    final existingUser = await localDataSource.getUserByName(user.name);
    if (existingUser == null) {
      return _addUserOrThrow(companion);
    } else {
      throw UserExistsFailure("User with name: ${user.name} and no email, already "
          "exists, can you can you try with another name");
    }
  }

  returnExistingUserWithMailOrAddedUser(UserEntity user, UserTableDriftCompanion companion) async {
    final existingUser = await localDataSource.getUserByEmail(user.email);
    if (existingUser == null) {
      return _addUserOrThrow(companion);
    } else {
      return UserMapper.entityFromTableDrift(existingUser);
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser(UserEntity user) async {
    return _executeDatabaseOperation(() {
      final companion = UserMapper.entityToCompanion(user);
      return localDataSource.updateUser(companion);
    });
  }

  @override
  Future<Either<Failure, int>> deleteUser(int userId) {
    return _executeDatabaseOperation(() => localDataSource.deleteUser(userId));
  }

  @override
  Future<Either<Failure, UserEntity>> getUserById(int id) {
    return _executeDatabaseOperation(() async {
      final user = await localDataSource.getUserById(id);
      return _checkForNullAndReturnUser(user);
    });
  }

  // @override
  // Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsAll() {
  //   return _handleDatabaseOperation(() async {
  //     final items = await localDataSource.getUserItemsAll();
  //     _checkItemsNotNullOrEmpty(items);
  //     return UserMapper.entityItemsFromTableDriftItems(items!);
  //   });
  // }

  @override
  Future<Either<Failure, int>> addUserToUser(
      int userLinkedId, int userId, String name, UserStatus status) {
    return _executeDatabaseOperation(() => localDataSource.addUserToUser(
          userLinkedId,
          userId,
          name,
          userStatusMapToString[status] ?? 'PENDING',
        ));
  }

  @override
  Future<Either<Failure, int>> deleteUserFromUser(int userLinkedId, int userId) {
    return _executeDatabaseOperation(
        () => localDataSource.deleteUserFromUser(userLinkedId, userId));
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmailAndPassword(String email, String password) {
    return _executeDatabaseOperation(() async {
      final user = await localDataSource.getUserByEmailAndPassword(email, password);
      return _isUserOrThrow(user);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmail(String email) {
    return _executeDatabaseOperation(() async {
      final user = await localDataSource.getUserByEmail(email);
      return _checkForNullAndReturnUser(user);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByName(String name) {
    return _executeDatabaseOperation(() async {
      final user = await localDataSource.getUserByName(name);
      return _checkForNullAndReturnUser(user);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(IdSet idSet) {
    return _processUserItems(localDataSource.getUserItemsByIdSet(idSet));
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getPendingAndAcceptedUserItems(int userId) {
    return _processUserItems(localDataSource.getPendingAndAcceptedUserItems(userId));
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getPendingInvitations(int userId) {
    return _processUserItems(localDataSource.getPendingInvitations(userId));
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getSendInvitations(int userId) {
    return _processUserItems(localDataSource.getSendInvitations(userId));
  }

  Future<Either<Failure, OrganizerItems<UserEntity>>> _processUserItems(
      Future<List<UserTableDriftG?>?> fetchItemsFuture) {
    return _executeDatabaseOperation(() async {
      final items = await fetchItemsFuture;
      if (items == null || items.isEmpty) {
        return OrganizerItems.empty();
      } else {
        final nonNullItems = _filterNonNullItems<UserTableDriftG>(items!);
        return UserMapper.entityItemsFromTableDriftItems(nonNullItems);
      }
    });
  }

  Future<Either<Failure, T>> _executeDatabaseOperation<T>(Future<T> Function() operation) async {
    try {
      final result = await operation();
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      } else {
        return Left(LocalFailure(e.toString()));
      }
    }
  }

  UserEntity _checkForNullAndReturnUser(UserTableDriftG? item) {
    if (item == null) {
      return UserEntity.empty();
    } else {
      return UserMapper.entityFromTableDrift(item);
    }
  }

  UserEntity _isUserOrThrow(UserTableDriftG? item) {
    if (item == null) {
      throw const UserNotFoundFailure("User not found");
    } else {
      return UserMapper.entityFromTableDrift(item);
    }
  }

  List<T> _filterNonNullItems<T>(List<dynamic> items) {
    final nonNullItems = items.whereType<T>().toList();
    if (nonNullItems.length != items.length) {
      throw const IncompleteDataFailure("Incomplete data found");
    }

    if (nonNullItems.isEmpty) {
      throw const UserNotFoundFailure("No items found");
    }

    return nonNullItems;
  }

  Future<UserEntity> _addUserOrThrow(UserTableDriftCompanion userCompanion) async {
    final userId = await localDataSource.addUser(userCompanion);
    final newUser = await localDataSource.getUserById(userId);
    if (newUser == null) {
      throw const UserNotFoundFailure("User could not be added not added");
    } else {
      return UserMapper.entityFromTableDrift(newUser);
    }
  }
}
