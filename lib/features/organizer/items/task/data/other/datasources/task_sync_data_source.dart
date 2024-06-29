import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source_impl.dart';
import 'package:fo_fe/features/organizer/items/task/data/other/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

abstract class TaskSyncDataSource {
  Future<TaskModel> syncTaskWithId(int id);

  Future<OrganizerItems<TaskModel>> syncTaskListWithIdSet(IdSet idSet);
}

class TaskSyncDataSourceImpl implements TaskSyncDataSource {
  TaskLocalDataSource taskLocalDataSource;
  TaskRemoteDataSourceImpl taskRemoteDataSource;

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

//todo implementation tests
  @override
  Future<OrganizerItems<TaskModel>> syncTaskListWithIdSet(IdSet idSet) async {
    final items = await taskLocalDataSource.getTaskListByIdSet(idSet);
    final remoteItems = await taskRemoteDataSource.getUpdatedItems(items);
    final updatedItems = items.toBuilder()
      ..updateItems(_getOnlyRemoteUpdatedItems(remoteItems))
      ..addAll(await _getLocalyUpdatedItemsCreatedRemote(remoteItems));

    return Future.value(updatedItems.build());
  }

  OrganizerItems<TaskModel> _getOnlyRemoteUpdatedItems(
      OrganizerItems<TaskModel> remoteItems) {
    return OrganizerItems.empty();
  }

  // todo how to do it
  // to get the id it had to be included in the local DB
  Future<OrganizerItems<TaskModel>> _getLocalyUpdatedItemsCreatedRemote(
      OrganizerItems<TaskModel> remoteItems) {
    final remoteCreatedItems = _getRemoteCreatedItems(remoteItems);
    return remoteCreatedItems;
  }

  //todo implement and test
  Future<OrganizerItems<TaskModel>> _getRemoteCreatedItems(
      OrganizerItems<TaskModel> remoteItems) {
    return Future.value(OrganizerItems.empty());
  }
}
