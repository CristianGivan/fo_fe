// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/const/failures_message.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';
import 'package:fo_fe/features/organizer/items/task/data/other/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../datasources/task_sync_data_source.dart';

class TaskRepositoryOld implements TaskRepository {
  final NetworkInfo networkInfo;
  final TaskLocalDataSource taskLocalDataSource;
  final TaskSyncDataSource taskSyncDataSource;

  TaskRepositoryOld({
    required this.networkInfo,
    required this.taskLocalDataSource,
    required this.taskSyncDataSource,
  });

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) async {
    Either<Failure, TaskModel> result;
    try {
      if (await networkInfo.isInternet) {
        result = Right(await taskSyncDataSource.syncTaskWithId(id));
      } else {
        result = Right(await taskLocalDataSource.getTaskById(id));
      }
      result.fold((failure) => result = Left(failure), (taskModel) {
        if (taskModel == TaskModel.empty()) {
          result = const Left(NoDataFailure(noDataFailure));
        } else {
          result = Right(taskModel);
        }
      });
    } on ServerException catch (e) {
      result = Left(ServerFailure(e.message));
    }

    return result;
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet) async {
    final Right<dynamic, OrganizerItems<TaskEntity>> eitherOrganizerItems;

    try {
      if (await networkInfo.isInternet) {
        eitherOrganizerItems =
            Right(await taskSyncDataSource.syncTaskListWithIdSet(idSet));
      } else {
        eitherOrganizerItems =
            Right(await taskLocalDataSource.getTaskListByIdSet(idSet));
      }
      return eitherOrganizerItems.fold((failure) => Left(failure),
          (result) => _handleEmptyOrganizerItems(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  Either<Failure, OrganizerItems<TaskEntity>> _handleEmptyOrganizerItems(
      OrganizerItems<TaskEntity> result) {
    if (result.isEmpty()) {
      return const Left(NoDataFailure(noDataFailure));
    } else {
      return Right(result);
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> postTask(TaskEntity task) {
    // TODO: implement postTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> putTask(TaskEntity task) {
    // TODO: implement putTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<OrganizerItemEntity>>>
      getOrganizerItemsByIdSet(IdSet id) {
    // TODO: implement getOrganizerItemsByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll() {
    // TODO: implement getAllTaskList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addReminderToTask(
      int taskId, ReminderEntity reminder) {
    // TODO: implement addReminderToTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addTagToTask(int taskId, int tagId) {
    // TODO: implement addTagToTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addTask(TaskEntity task) {
    // TODO: implement addTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> addUserToTask(int taskId, int userId) {
    // TODO: implement addUserToTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskListByIdSet(
      IdSet idSet) {
    // TODO: implement getTaskListByIdSet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
}
