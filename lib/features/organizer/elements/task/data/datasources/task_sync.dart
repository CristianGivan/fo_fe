import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_cache_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

abstract class TaskSync {
  Future<TaskEntity> syncTaskWithId(int id);
}

class TaskSyncImpl implements TaskSync {
  TaskCacheDataSource taskCacheDataSource;
  TaskLocalDataSource taskLocalDataSource;
  TaskRemoteDataSource taskRemoteDataSource;

  TaskSyncImpl(
    this.taskCacheDataSource,
    this.taskLocalDataSource,
    this.taskRemoteDataSource,
  );

  @override
  Future<TaskEntity> syncTaskWithId(int id) {
    // TODO: implement syncTaskWithId
    throw UnimplementedError();
  }
}
