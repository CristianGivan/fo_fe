import '../../task_lib.dart';

abstract class TaskLocalDataSource {
  Future<TaskModel> putTask(TaskModel task);

  Future<TaskModel> postTask(TaskModel task);

  Future<TaskModel> getTaskById(int id);

  // Future<OrganizerItems> getTaskListByIdSet(IdSet idSet);

  Future<void> deleteTask(int id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  @override
  Future<void> deleteTask(int id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getTaskById(int id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> postTask(TaskModel task) {
    // TODO: implement postTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> putTask(TaskModel task) {
    // TODO: implement putTask
    throw UnimplementedError();
  }

// @override
// Future<OrganizerItems> getTaskListByIdSet(IdSet idSet) {
//   // TODO: implement getTaskListByIdSet
//   throw UnimplementedError();
// }
}
