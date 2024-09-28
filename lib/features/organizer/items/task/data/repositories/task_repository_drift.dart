import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_mapper.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';

class TaskRepositoryDrift implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryDrift({required this.localDataSource});

  // Task CRUD operations
  @override
  Future<Either<Failure, int>> addTask(TaskEntity task) async {
    return _handleDatabaseOperation(() {
      final companion = TaskMapper.entityToCompanion(task);
      _checkItemNotNull(companion);
      return localDataSource.addTask(companion);
    });
  }

  @override
  Future<Either<Failure, bool>> updateTask(TaskEntity task) async {
    return _handleDatabaseOperation(() {
      final companion = TaskMapper.entityToCompanion(task);
      _checkItemNotNull(companion);
      return localDataSource.updateTask(companion);
    });
  }

  @override
  Future<Either<Failure, int>> deleteTask(int taskId) {
    return _handleDatabaseOperation(() => localDataSource.deleteTask(taskId));
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) {
    return _handleDatabaseOperation(() async {
      final item = await localDataSource.getTaskById(id);
      _checkItemNotNull(item);
      return TaskMapper.entityFromTableDrift(item!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getTaskItemsAll();
      _checkItemsNotNullOrEmpty(items);
      return TaskMapper.entityItemsFromTableDriftItems(items!);
    });
  }

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) {
    return _handleDatabaseOperation<OrganizerItems<TaskEntity>>(
      () async {
        final items = await localDataSource.getTaskItemsByIdSet(idSet);
        _checkItemsNotNullOrEmpty(items);

        final nonNullItems = _filterNonNullItems<TaskTableDriftG>(items!);
        return TaskMapper.entityItemsFromTableDriftItems(nonNullItems);
      },
    );
  }

  // User operations related to tasks
  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTaskId(
      int taskId) {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getUserItemsByTaskId(taskId);
      _checkItemsNotNullOrEmpty(items);

      final nonNullItems = _filterNonNullItems<UserTableDriftG>(items!);
      return UserMapper.entityItemsFromTableDriftItems(nonNullItems);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getCreatorById(int creatorId) {
    return _handleDatabaseOperation(() async {
      final userModel = await localDataSource.getCreatorById(creatorId);
      _checkItemNotNull(userModel);
      return UserMapper.entityFromTableDrift(userModel!);
    });
  }

  @override
  Future<Either<Failure, int>> addUserToTask(int taskId, int userId) {
    return _handleDatabaseOperation(
        () => localDataSource.addUserToTask(taskId, userId));
  }

  @override
  Future<Either<Failure, int>> deleteUserFromTask(int taskId, int userId) {
    return _handleDatabaseOperation(
        () => localDataSource.deleteUserFromTask(taskId, userId));
  }

  // Tag operations related to tasks
  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByTaskId(
      int taskId) {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getTagItemsByTaskId(taskId);
      _checkItemsNotNullOrEmpty(items);

      final nonNullItems = _filterNonNullItems<TagTableDriftG>(items!);
      return TagMapper.entityItemsFromTableDriftItems(nonNullItems);
    });
  }

  @override
  Future<Either<Failure, int>> addTagToTask(int taskId, int tagId) {
    return _handleDatabaseOperation(
        () => localDataSource.addTagToTask(taskId, tagId));
  }

  @override
  Future<Either<Failure, int>> deleteTagFromTask(int taskId, int tagId) {
    return _handleDatabaseOperation(
        () => localDataSource.deleteTagFromTask(taskId, tagId));
  }

  // Reminder operations related to tasks
  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getRemindersByTaskId(
      int taskId) {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getRemindersByTaskId(taskId);
      _checkItemsNotNullOrEmpty(items);

      final nonNullItems = _filterNonNullItems<ReminderTableDriftG>(items!);
      return ReminderMapper.entityItemsFromTableDriftItems(nonNullItems);
    });
  }

  @override
  Future<Either<Failure, int>> addReminderToTask(int taskId, int reminderId) {
    return _handleDatabaseOperation(
        () => localDataSource.addReminderToTask(taskId, reminderId));
  }

  @override
  Future<Either<Failure, int>> deleteReminderFromTask(
      int taskId, int reminderId) {
    return _handleDatabaseOperation(
        () => localDataSource.deleteReminderFromTask(taskId, reminderId));
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> addTagItemsToTask(
      int taskId, List<int> tags) {
    return _handleDatabaseOperation(() async {
      await localDataSource.addTagItemsToTask(taskId, tags);
      final tagModels = await localDataSource.getTagItemsByTaskId(taskId);
      _checkItemsNotNullOrEmpty(tagModels);
      return TagMapper.entityItemsFromTableDriftItems(tagModels!);
    });
  }

  @override
  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id) {
    // TODO: implement getTaskByIdLazyLoaded
    throw UnimplementedError();
  }

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(
      Future<T> Function() operation) async {
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
      throw const TaskNotFoundFailure("Task not found");
    }
  }

  void _checkItemsNotNullOrEmpty(List<dynamic>? items) {
    if (items == null || items.isEmpty) {
      throw const TaskNotFoundFailure("Task not found");
    }
  }

  List<T> _filterNonNullItems<T>(List<dynamic> items) {
    final nonNullItems = items.whereType<T>().toList();
    if (nonNullItems.length != items.length) {
      throw const IncompleteDataFailure(
          "Task not found"); // Custom failure for incomplete data
    }

    if (nonNullItems.isEmpty) {
      throw const TaskNotFoundFailure("Task not found");
    }

    return nonNullItems;
  }
}
