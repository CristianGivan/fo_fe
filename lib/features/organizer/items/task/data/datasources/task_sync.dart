import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_items.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_remote_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

abstract class TaskSync {
  Future<TaskModel> syncTaskWithId(int id);

  Future<OrganizerItems> syncTaskListWithIdSet(IdSet idSet);
}

class TaskSyncImpl implements TaskSync {
  TaskLocalDataSource taskLocalDataSource;
  TaskRemoteDataSource taskRemoteDataSource;

  TaskSyncImpl({
    required this.taskLocalDataSource,
    required this.taskRemoteDataSource,
  });

  @override
  Future<TaskModel> syncTaskWithId(int id) async {
    TaskModel taskModel;

    taskModel = await taskLocalDataSource.getTaskById(id);
    Map<String, dynamic> jsonSend = taskModel.sendJsonToCheckIfIsUpdated();
    Map<String, dynamic> jsonResponse =
        await taskRemoteDataSource.getUpdatedTaskIfDifferent(jsonSend);

    if (jsonSend["checksum"] != jsonResponse["checksum"]) {
      //todo check if the response Json is valid
      taskModel = TaskModel.fromJson(jsonResponse);
      taskLocalDataSource.postTask(taskModel);
    }

    return taskModel;
  }

  @override
  Future<OrganizerItems> syncTaskListWithIdSet(IdSet idSet) {
    // TODO: implement syncTaskListWithIdSet
    throw UnimplementedError();
  }
}
