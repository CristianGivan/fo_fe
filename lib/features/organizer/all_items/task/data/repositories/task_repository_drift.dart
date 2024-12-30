import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_db.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/utils/reminder_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/models/task_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/models/task_user_link_mapper.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TaskRepositoryDrift implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryDrift({required this.localDataSource});

  // Task CRUD operations
  @override
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task) async {
    return _handleDatabaseOperation(() async {
      final companion = TaskMapper.entityToCompanion(task);
      final addTask = await localDataSource.addTask(companion);
      if (addTask == null) throw const TaskFailure("Task not added");
      return TaskMapper.entityFromTableDrift(addTask);
    });
  }

  @override
  Future<Either<Failure, TaskUserLinkEntity>> addTaskUserLink(
      TaskUserLinkEntity taskUserLinkEntity) async {
    return _handleDatabaseOperation(() async {
      final companion = TaskUserLinkMapper.companionFromEntity(taskUserLinkEntity);
      final addTask = await localDataSource.addTaskUserLink(companion);
      if (addTask == null) throw const TaskFailure("Task not added");
      return TaskUserLinkMapper.entityFromTableDrift(addTask);
    });
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task) async {
    return _handleDatabaseOperation(() async {
      final companion = TaskMapper.entityToCompanion(task);
      final updatedTask = await localDataSource.updateTask(companion);
      if (updatedTask == null) throw const TaskFailure("Task not updated");
      return TaskMapper.entityFromTableDrift(updatedTask);
    });
  }

  @override
  Future<Either<Failure, TaskUserLinkEntity>> updateTaskUserLink(
      TaskUserLinkEntity taskUserLink) async {
    return _handleDatabaseOperation(() async {
      final companion = TaskUserLinkMapper.entityToCompanion(taskUserLink);
      final updatedTask = await localDataSource.updateTaskUserLink(companion);
      if (updatedTask == null) throw const TaskFailure("Task not updated");
      return TaskUserLinkMapper.entityFromTableDrift(updatedTask);
    });
  }

  @override
  Future<Either<Failure, int>> deleteTask(int taskId) {
    return _handleDatabaseOperation(() => localDataSource.deleteTask(taskId));
  }

  @override
  Future<Either<Failure, IdSet>> deleteTaskItems(IdSet idSet) {
    return _handleDatabaseOperation(
        () async => IdSet.of(localDataSource.deleteTaskItems(idSet.toSet()) as Iterable<int?>));
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
      return _returnEmptyOrOrganizerItemsFromTableDriftList(items);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<ItemEntity>>> getTaskItemsFromUser(TaskParams params) {
    return _handleDatabaseOperation(() async {
      if (params.itemReturnType == ItemReturn.entity) {
        final items = await localDataSource.getTaskItemsFromUser(params.forUserId);
        return _returnEmptyOrOrganizerItemsFromTableDriftList(items);
      } else {
        final items = await localDataSource.getTaskDtoItemsFromUser(params.forUserId);
        if (items == null || items.isEmpty) {
          return OrganizerItems<TaskDto>.empty();
        } else {
          return OrganizerItems.of(items);
        }
      }
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskDto>>> getTaskDtoItemsFromUser(int userId) {
    return _handleDatabaseOperation(() async {
      final items = await localDataSource.getTaskDtoItemsFromUser(userId);
      if (items == null || items.isEmpty) {
        return OrganizerItems<TaskDto>.empty();
      } else {
        return OrganizerItems.of(items);
      }
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(IdSet idSet) {
    return _handleDatabaseOperation<OrganizerItems<TaskEntity>>(
      () async {
        return _filterNonNullItems<TaskEntity, TaskTableDriftG>(
            await localDataSource.getTaskItemsByIdSet(idSet),
            TaskMapper.entityItemsFromTableDriftItems);
      },
    );
  }

  // User operations related to tasks
  @override
  Future<Either<Failure, UserEntity>> getCreatorTaskById(int creatorId) {
    return _handleDatabaseOperation(() async {
      final userModel = await localDataSource.getCreatorById(creatorId);
      _checkItemNotNull(userModel);
      return UserMapper.entityFromTableDrift(userModel!);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTaskId(int taskId) {
    return _handleDatabaseOperation(() async {
      return _filterNonNullItems<UserEntity, UserTableDriftG>(
          await localDataSource.getUserItemsByTaskId(taskId),
          UserMapper.entityItemsFromTableDriftItems);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> updateUserItemOfTask(
    int taskId,
    List<int> addedUserItems,
    List<int> removedUserItems,
  ) {
    return _handleDatabaseOperation(() async {
      if (addedUserItems != []) {
        addUserItemsToTask(taskId, addedUserItems);
      }
      if (removedUserItems != []) {
        localDataSource.deleteUserItemsFromTask(taskId, removedUserItems);
      }
      return _filterNonNullItems<UserEntity, UserTableDriftG>(
          await localDataSource.getUserItemsByTaskId(taskId),
          UserMapper.entityItemsFromTableDriftItems);
    });
  }

  // todo -implement- when I have time
  void addUserItemsToTask(int taskId, List<int> addedUserItems) {
    throw UnimplementedError("Method not implemented");
  }

  // Tag operations related to tasks
  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByTaskId(int taskId) {
    return _handleDatabaseOperation(() async {
      return _filterNonNullItems<TagEntity, TagTableDriftG>(
          await localDataSource.getTagItemsByTaskId(taskId),
          TagMapper.entityItemsFromTableDriftItems);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> updateTagItemOfTask(
    int taskId,
    List<int> addedTagItems,
    List<int> removedTagItems,
  ) {
    return _handleDatabaseOperation(() async {
      if (addedTagItems != []) {
        localDataSource.addTagItemsToTask(taskId, addedTagItems);
      }
      if (removedTagItems != []) {
        localDataSource.deleteTagItemsFromTask(taskId, removedTagItems);
      }
      return _filterNonNullItems<TagEntity, TagTableDriftG>(
          await localDataSource.getTagItemsByTaskId(taskId),
          TagMapper.entityItemsFromTableDriftItems);
    });
  }

  // Reminder operations related to tasks
  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getRemindersByTaskId(int taskId) {
    return _handleDatabaseOperation(() async {
      return _filterNonNullItems<ReminderEntity, ReminderTableDriftG>(
          await localDataSource.getReminderItemsByTaskId(taskId),
          ReminderMapper.entityItemsFromTableDriftItems);
    });
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> updateReminderItemOfTask(
    int taskId,
    List<int> addedReminderItems,
    List<int> removedReminderItems,
  ) {
    return _handleDatabaseOperation(() async {
      if (addedReminderItems != []) {
        localDataSource.addReminderItemsToTask(taskId, addedReminderItems);
      }
      if (removedReminderItems != []) {
        localDataSource.deleteReminderItemsFromTask(taskId, removedReminderItems);
      }
      return _filterNonNullItems<ReminderEntity, ReminderTableDriftG>(
          await localDataSource.getReminderItemsByTaskId(taskId),
          ReminderMapper.entityItemsFromTableDriftItems);
    });
  }

  @override
  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id) {
    // TODO: implement getTaskByIdLazyLoaded
    throw UnimplementedError();
  }

  OrganizerItems<TaskEntity> _returnEmptyOrOrganizerItemsFromTableDriftList(
      List<TaskTableDriftG>? items) {
    if (items == null || items.isEmpty) {
      return OrganizerItems<TaskEntity>.empty();
    } else {
      return TaskMapper.entityItemsFromTableDriftItems(items);
    }
  }

  Future<Either<Failure, T>> _handleDatabaseOperation<T>(Future<T> Function() operation) async {
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
      throw const TaskFailure("Task not found");
    }
  }

  OrganizerItems<T> _filterNonNullItems<T extends OrganizerItemEntity, G extends DataClass>(
    List<dynamic>? items,
    OrganizerItems<T> Function(List<G>) mapperFunction,
  ) {
    if (items == null || items.isEmpty) {
      return OrganizerItems<T>.empty();
    }
    final nonNullItems = items.whereType<G>().toList();
    if (nonNullItems.isEmpty) {
      return OrganizerItems<T>.empty();
    }
    return mapperFunction(nonNullItems);
  }
}
