import '../../task_lib.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> putTask(TaskModel task);

  Future<TaskModel> postTask(TaskModel task);

  Future<TaskModel> getTaskById(int id);

  Future<void> deleteTask(int id);
}
