import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/data/models/reminder_mapper.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source_drift.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_mapper.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

class TaskRepositoryDrift implements TaskRepository {
  final TaskLocalDataSourceDrift localDataSource;

  TaskRepositoryDrift({required this.localDataSource});

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(
    Future<T> Function() operation,
  ) async {
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

  Future<Either<Failure, TaskEntity>> getTaskById(int id) {
    return _handleDatabaseOperation(() async {
      final taskModel = await localDataSource.getTaskById(id);
      if (taskModel != null) {
        return TaskMapper.modelToEntity(taskModel);
      } else {
        throw TaskNotFoundFailure();
      }
    });
  }

  @override
  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id) {
    return _handleDatabaseOperation(() async {
      final taskModel = await localDataSource.getTaskByIdLazyLoaded(id);
      if (taskModel != null) {
        return TaskMapper.modelLazyLoadedToEntityLazyLoaded(taskModel);
      } else {
        throw TaskNotFoundFailure();
      }
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() {
    return _handleDatabaseOperation(() async {
      final taskModels = await localDataSource.getTaskItemsAll();
      return OrganizerItems.of(
          taskModels.map(TaskMapper.modelToEntity).toList());
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) {
    return _handleDatabaseOperation(() async {
      final taskModels = await localDataSource.getTaskItemsByIdSet(idSet);
      return OrganizerItems.of(
          taskModels.map(TaskMapper.modelToEntity).toList());
    });
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
        throw TaskNotFoundFailure();
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
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagsByTaskId(
      int taskId) {
    return _handleDatabaseOperation(() async {
      final tagModels = await localDataSource.getTagsByTaskId(taskId);
      return TagMapper.entityItemsFromModelItems(tagModels);
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
}
