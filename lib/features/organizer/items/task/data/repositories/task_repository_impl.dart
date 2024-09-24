import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/user/domain/entities/user_entity.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, int>> addReminderToTask(int taskId, int reminderId) {
    // TODO: implement addReminderToTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> addTagToTask(int taskId, int tagId) {
    // TODO: implement addTagToTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> addUserToTask(int taskId, int userId) {
    // TODO: implement addUserToTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteReminderFromTask(
      int taskId, int reminderId) {
    // TODO: implement deleteReminderFromTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteTagFromTask(int taskId, int tagId) {
    // TODO: implement deleteTagFromTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteUserFromTask(int taskId, int userId) {
    // TODO: implement deleteUserFromTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> getCreatorById(int creatorId) {
    // TODO: implement getCreatorById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getRemindersByTaskId(
      int taskId) {
    // TODO: implement getRemindersByTaskId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByTaskId(
      int taskId) {
    // TODO: implement getTagsByTaskId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id) {
    // TODO: implement getTaskByIdLazyLoaded
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() {
    // TODO: implement getTaskItemsAll
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) {
    // TODO: implement getTaskItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTaskId(
      int taskId) {
    // TODO: implement getUsersByTaskId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> addTask(TaskEntity task) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> updateTask(TaskEntity task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> addTagItemsToTask(
      int taskId, List<int> tags) {
    // TODO: implement addTagItemsToTask
    throw UnimplementedError();
  }
}

//   @override
//   Future<Either<Failure, TaskEntity>> getTaskById(int id) {
//     // TODO: implement getTaskById
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() async {
//     try {
//       final localTasks = await localDataSource.getAllTasks();
//       return Right(localTasks);
//     } catch (e) {
//       return Left(LocalFailure('Failed to load all tasks'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
//       IdSet idSet) async {
//     try {
//       final localTasks = await localDataSource.getTasksByIdSet(idSet);
//       return Right(localTasks);
//     } catch (e) {
//       return Left(LocalFailure('Failed to load tasks'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> addTask(TaskEntity task) async {
//     try {
//       await localDataSource.addTask(task);
//       await remoteDataSource.addTask(task);
//       return Right(null);
//     } catch (e) {
//       return const Left(LocalFailure('Failed to add task'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> addUserToTask(int taskId, int userId) async {
//     try {
//       await localDataSource.addUserToTask(taskId, userId);
//       await remoteDataSource.addUserToTask(taskId, userId);
//       return Right(null);
//     } catch (e) {
//       return Left(LocalFailure('Failed to add user to task'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> addTagToTask(int taskId, int tagId) async {
//     try {
//       await localDataSource.addTagToTask(taskId, tagId);
//       await remoteDataSource.addTagToTask(taskId, tagId);
//       return Right(null);
//     } catch (e) {
//       return Left(LocalFailure('Failed to add tag to task'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> addReminderToTask(
//       int taskId, ReminderEntity reminder) async {
//     try {
//       await localDataSource.addReminderToTask(taskId, reminder);
//       await remoteDataSource.addReminderToTask(taskId, reminder);
//       return Right(null);
//     } catch (e) {
//       return Left(LocalFailure('Failed to add reminder to task'));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> deleteTask(int taskId) {
//     // TODO: implement deleteTask
//     throw UnimplementedError();
//   }
// }

//   final TaskDaoDrift taskDao;
//
//   TaskRepositoriesDrift(this.taskDao);
//
//   @override
//   Future<void> deleteTask(TaskEntity task) {
//     // TODO: implement deleteTask
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<Failure, TaskEntity>> getTaskById(int id) {
//     // TODO: implement getTaskById
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() async {
//     Either<Failure, OrganizerItems<TaskEntity>> result;
//     final tasks = (await taskDao.getAllTasks());
//     final OrganizerItems<TaskEntity> taskEntities = await Future.wait(
//         tasks.map((e) async => TaskModelDrift.toTaskEntityE(e)));
//     result = Right(OrganizerItems.of(taskEntities));
//
//     return result;
//   }
//
//   @override
//   Future<Either<Failure, TaskEntity>> postTask(TaskEntity task) {
//     // TODO: implement postTask
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<Failure, TaskEntity>> putTask(TaskEntity task) {
//     // TODO: implement putTask
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
//       IdSet id) {
//     // TODO: implement getTaskListByIdSet
//     throw UnimplementedError();
//   }
// }
