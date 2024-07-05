import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_mapper.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../models/task_model.dart';

class TaskRepositoryDrift implements TaskRepository {
  final TaskDaoDrift taskDao;

  TaskRepositoryDrift({required this.taskDao});

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) async {
    try {
      final table = await taskDao.getTaskById(id);
      final taskModel = TaskMapper.fromTaskTableDrift(table!);
      return Right(taskModel);
    } catch (e) {
      return Left(LocalFailure(""));
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() async {
    try {
      final tables = await taskDao.getAllTasks();
      final tasks = tables.map(TaskMapper.fromTaskTableDrift).toList();
      return Right(OrganizerItems.of(tasks));
    } catch (e) {
      return Left(LocalFailure(""));
    }
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) async {
    try {
      final tables = await taskDao.getTaskItemsByIdSet(idSet);
      final tasks = tables.map(TaskMapper.fromTaskTableDrift).toList();
      return Right(OrganizerItems.of(tasks));
    } catch (e) {
      return Left(LocalFailure(""));
    }
  }

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) async {
    try {
      final taskCompanion =
          TaskMapper.toTaskTableDriftCompanion(task as TaskModel);
      await taskDao.insertTask(taskCompanion);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure(""));
    }
  }

  @override
  Future<Either<Failure, void>> addUserToTask(int taskId, int userId) async {
    // Implementation based on your requirements
    // For example, you might need to update task records or user records
    return Right(null);
  }

  @override
  Future<Either<Failure, void>> addTagToTask(int taskId, int tagId) async {
    // Implementation based on your requirements
    return Right(null);
  }

  @override
  Future<Either<Failure, void>> addReminderToTask(
      int taskId, ReminderEntity reminder) async {
    // Implementation based on your requirements
    return Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteTask(int taskId) async {
    try {
      await taskDao.deleteTask(taskId);
      return Right(null);
    } catch (e) {
      return Left(LocalFailure(""));
    }
  }
}
