import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;
  final TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() async {
    try {
      final localTasks = await localDataSource.getAllTasks();
      return Right(localTasks);
    } catch (e) {
      return Left(LocalFailure('Failed to load all tasks'));
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) async {
    try {
      final localTasks = await localDataSource.getTasksByIdSet(idSet);
      return Right(localTasks);
    } catch (e) {
      return Left(LocalFailure('Failed to load tasks'));
    }
  }

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) async {
    try {
      await localDataSource.addTask(task);
      await remoteDataSource.addTask(task);
      return Right(null);
    } catch (e) {
      return const Left(LocalFailure('Failed to add task'));
    }
  }

  @override
  Future<Either<Failure, void>> addUserToTask(int taskId, int userId) async {
    try {
      await localDataSource.addUserToTask(taskId, userId);
      await remoteDataSource.addUserToTask(taskId, userId);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure('Failed to add user to task'));
    }
  }

  @override
  Future<Either<Failure, void>> addTagToTask(int taskId, int tagId) async {
    try {
      await localDataSource.addTagToTask(taskId, tagId);
      await remoteDataSource.addTagToTask(taskId, tagId);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure('Failed to add tag to task'));
    }
  }

  @override
  Future<Either<Failure, void>> addReminderToTask(
      int taskId, ReminderEntity reminder) async {
    try {
      await localDataSource.addReminderToTask(taskId, reminder);
      await remoteDataSource.addReminderToTask(taskId, reminder);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure('Failed to add reminder to task'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
}

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
