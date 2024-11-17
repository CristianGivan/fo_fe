import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserRepositoryDrift implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryDrift({required this.localDataSource});

  // User CRUD operations
  @override
  Future<Either<Failure, UserEntity>> addUser(UserEntity user) async {
    return _executeDatabaseOperation(() async {
      final companion = UserMapper.entityToCompanion(user);
      if (user.email != "") {
        final existingUser = await localDataSource.getUserByEmail(user.email);
        return _getOrCreateUser(existingUser, companion);
      } else if (user.name != "") {
        final existingUser = await localDataSource.getUserByName(user.name);
        return _getOrCreateUser(existingUser, companion);
      } else {
        final newUserId = await localDataSource.addUser(companion);
        return _getUserOrThrow(newUserId);
      }
    });
  }

  @override
  Future<Either<Failure, bool>> updateUser(UserEntity user) async {
    return _executeDatabaseOperation(() {
      final companion = UserMapper.entityToCompanion(user);
      _checkItemNotNull(companion);
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
      final item = await localDataSource.getUserById(id);
      _checkItemNotNull(item);
      return UserMapper.entityFromTableDrift(item!);
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
  Future<Either<Failure, int>> addUserToUser(int userLinkedId, int userId) {
    return _executeDatabaseOperation(() => localDataSource.addUserToUser(userLinkedId, userId));
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
      _checkItemNotNull(user);
      return UserMapper.entityFromTableDrift(user!);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByEmail(String email) {
    return _executeDatabaseOperation(() async {
      final user = await localDataSource.getUserByEmail(email);
      _checkItemNotNull(user);
      return UserMapper.entityFromTableDrift(user!);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getUserByName(String name) {
    return _executeDatabaseOperation(() async {
      final user = await localDataSource.getUserByName(name);
      _checkItemNotNull(user);
      return UserMapper.entityFromTableDrift(user!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByIdSet(IdSet idSet) {
    return _processUserItems(localDataSource.getUserItemsByIdSet(idSet));
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getConnectedUserItemsByUserId(int userId) {
    return _processUserItems(localDataSource.getConnectedUserIdsByUserId(userId));
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
      _checkItemsNotNullOrEmpty(items);

      final nonNullItems = _filterNonNullItems<UserTableDriftG>(items!);
      return UserMapper.entityItemsFromTableDriftItems(nonNullItems);
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

  void _checkItemNotNull(dynamic item) {
    if (item == null) {
      throw const UserNotFoundFailure("User not found");
    }
  }

  void _checkItemsNotNullOrEmpty(List<dynamic>? items) {
    if (items == null || items.isEmpty) {
      throw const UserNotFoundFailure("No users found");
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

  Future<UserEntity> _getOrCreateUser(
    UserTableDriftG? userTable,
    UserTableDriftCompanion userCompanion,
  ) async {
    if (userTable != null) {
      return UserMapper.entityFromTableDrift(userTable);
    } else {
      final newUserId = await localDataSource.addUser(userCompanion);
      return _getUserOrThrow(newUserId);
    }
  }

  Future<UserEntity> _getUserOrThrow(int userId) async {
    final newUser = await localDataSource.getUserById(userId);
    if (newUser == null) {
      throw const UserNotFoundFailure("User not added");
    } else {
      return UserMapper.entityFromTableDrift(newUser);
    }
  }
}
