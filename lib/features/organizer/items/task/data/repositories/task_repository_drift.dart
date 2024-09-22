import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/data/models/reminder_mapper.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_mapper.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

class TaskRepositoryDrift implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryDrift({required this.localDataSource});

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

  // Task CRUD operations
  @override
  Future<Either<Failure, int>> insertTask(TaskEntity task) {
    final companion = TaskMapper.entityToCompanion(task);
    return _handleDatabaseOperation(
        () => localDataSource.insertTask(companion));
  }

  @override
  Future<Either<Failure, bool>> updateTask(TaskEntity task) {
    final companion = TaskMapper.entityToCompanion(task);
    return _handleDatabaseOperation(
        () => localDataSource.updateTask(companion));
  }

  @override
  Future<Either<Failure, int>> deleteTask(int taskId) {
    return _handleDatabaseOperation(() => localDataSource.deleteTask(taskId));
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) {
    return _handleDatabaseOperation(() async {
      final item = await localDataSource.getTaskById(id);
      if (item == null) {
        throw const TaskNotFoundFailure(); // Throw an exception if task is not found
      }

      return TaskMapper.entityFromTableDrift(item);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getTaskItemsAll();

      if (items == null || items.isEmpty) {
        throw const TaskNotFoundFailure();
      }

      return TaskMapper.entityItemsFromTableDriftItems(items);
    });
  }

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) {
    return _handleDatabaseOperation<OrganizerItems<TaskEntity>>(
      () async {
        final items = await localDataSource.getTaskItemsByIdSet(idSet);

        if (items == null || items.isEmpty) {
          throw const TaskNotFoundFailure();
        }

        final nonNullItems = items.whereType<TaskTableDriftG>().toList();
        if (nonNullItems.length != items.length) {
          throw const IncompleteDataFailure(); // Custom failure for incomplete data
        }

        if (nonNullItems.isEmpty) {
          throw const TaskNotFoundFailure();
        }

        return TaskMapper.entityItemsFromTableDriftItems(nonNullItems);
      },
    );
  }

  // User operations related to tasks
  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUsersByTaskId(
      int taskId) {
    return _handleDatabaseOperation(() async {
      final userModels = await localDataSource.getUsersByTaskId(taskId);
      return UserMapper.entityItemsFromModelItems(userModels);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getCreatorById(int creatorId) {
    return _handleDatabaseOperation(() async {
      final userModel = await localDataSource.getCreatorById(creatorId);
      if (userModel != null) {
        return UserMapper.entityFromModel(userModel);
      } else {
        throw const TaskNotFoundFailure();
      }
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
      return TagMapper.entityItemsFromTableDriftItems(items);
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
      final reminderModels = await localDataSource.getRemindersByTaskId(taskId);
      return ReminderMapper.entityItemsFromModelItems(reminderModels);
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
      return TagMapper.entityItemsFromModelItems(tagModels);
    });
  }

  @override
  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id) {
    // TODO: implement getTaskByIdLazyLoaded
    throw UnimplementedError();
  }
}
