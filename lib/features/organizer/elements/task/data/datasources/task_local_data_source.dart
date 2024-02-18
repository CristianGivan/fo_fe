import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

abstract class TaskLocalDataSource {
  Future<TaskEntity> putTask(TaskEntity task);

  Future<TaskEntity> postTask(TaskEntity task);

  Future<TaskEntity> getTaskById(int id);

  Future<void> deleteTask(TaskEntity task);
}
