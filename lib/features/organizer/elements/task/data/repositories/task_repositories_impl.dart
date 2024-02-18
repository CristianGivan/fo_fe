import 'package:dartz/dartz.dart';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/platform/network_info.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;
  final TaskLocalDataSource taskLocalDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.taskRemoteDataSource,
    required this.taskLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> deleteTask(TaskEntity task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) async {
    networkInfo.isConnected;

    return Right(await taskRemoteDataSource.getTaskById(id)); // todo update
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
}
