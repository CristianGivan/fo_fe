import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

abstract class TaskSyncDataSource {
  Future<TaskModel> syncTaskWithId(int id);

  Future<OrganizerItems<TaskModel>> syncTaskListWithIdSet(IdSet idSet);
}

class TaskSyncDataSourceImpl implements TaskSyncDataSource {
  TaskLocalDataSource taskLocalDataSource;
  TaskRemoteDataSource taskRemoteDataSource;

  TaskSyncDataSourceImpl({
    required this.taskLocalDataSource,
    required this.taskRemoteDataSource,
  });

  @override
  Future<TaskModel> syncTaskWithId(int id) async {
    TaskModel taskModel = await taskLocalDataSource.getTaskById(id);
    Map<String, dynamic> jsonSend = taskModel.jsonToCheckForUpdates();
    Map<String, dynamic> jsonResponse =
        await taskRemoteDataSource.getUpdatedTaskIfDifferent(jsonSend);

    if (jsonSend["checksum"] != jsonResponse["checksum"]) {
      //todo check if the response Json is valid
      taskModel = TaskModel.fromJson(jsonResponse);
      taskLocalDataSource.postTask(taskModel);
    }
    return taskModel;
  }

//todo tests
  @override
  Future<OrganizerItems<TaskModel>> syncTaskListWithIdSet(IdSet idSet) async {
    OrganizerItems<TaskModel> taskModelList =
        await taskLocalDataSource.getTaskListByIdSet(idSet);
    OrganizerItems<TaskModel> updatedTaskModelList =
        await taskRemoteDataSource.getUpdatedItems(taskModelList);
    _updateLocalDB(updatedTaskModelList);
    return _getUpdatedTaskList(taskModelList, updatedTaskModelList);
  }

  // todo how to do it
  Future<void> _updateLocalDB(OrganizerItems<TaskModel> updatedTaskModelList) {
    // TODO: implement connect
    throw UnimplementedError();
  }

  Future<OrganizerItems<TaskModel>> _getUpdatedTaskList(
      OrganizerItems<TaskModel> taskModelList,
      OrganizerItems<TaskModel> updatedTaskModelList) {
    return Future(() => taskModelList);
  }
}
