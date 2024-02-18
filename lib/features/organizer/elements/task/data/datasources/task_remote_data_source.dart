import '../../task_lib.dart';

abstract class TaskRemoteDataSource {
  Future<TaskEntity> putTask(TaskEntity task);

  Future<TaskEntity> postTask(TaskEntity task);

  Future<TaskEntity> getTaskById(int id);

  Future<void> deleteTask(TaskEntity task);
}
