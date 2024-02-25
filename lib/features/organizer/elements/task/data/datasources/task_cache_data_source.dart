import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

abstract class TaskCacheDataSource {
  Future<Map<String, dynamic>> getCacheTaskList();

  Future<Map<String, dynamic>> updateCacheTaskList(List<TaskModel> taskModelList);
}

// class TaskCacheDataSourceImpl implements TaskCacheDataSource {
// }
