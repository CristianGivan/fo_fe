// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/exceptions.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/network/network_info.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../datasources/task_sync.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource taskLocalDataSource;
  final TaskSync taskSync;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.taskLocalDataSource,
    required this.taskSync,
    required this.networkInfo,
  });

  @override
  Future<void> deleteTask(TaskEntity task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) async {
    Either<Failure, TaskEntity> result;
    try {
      if (await networkInfo.isConnected) {
        result = Right(await taskSync.syncTaskWithId(id));
      } else {
        result = Right(await taskLocalDataSource.getTaskById(id));
      }
      result.fold((failure) => result = Left(failure), (taskModel) {
        if (taskModel == TaskModel.empty()) {
          result = Left(LocalFailure());
        } else {
          result = Right(taskModel);
        }
      });
    } on ServerException catch (e) {
      result = Left(ServerFailure());
    }

    return result;
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
  Future<Either<Failure, TaskEntity>> getTaskByIdSet(IdSet ids) {
    // TODO: implement getTaskByIdSet
    throw UnimplementedError();
  }
}
