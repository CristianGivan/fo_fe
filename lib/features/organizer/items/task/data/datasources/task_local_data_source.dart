import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TaskLocalDataSource {
  Future<TaskTableDriftG?> addTaskAndLinkCreator(TaskTableDriftCompanion taskCompanion);

  Future<TaskTableDriftG?> updateTask(TaskTableDriftCompanion taskCompanion);

  Future<int> deleteTask(int taskId);

  Future<TaskTableDriftG?> getTaskById(int id);

  Future<List<TaskTableDriftG>?> getTaskItemsAll();

  Future<List<TaskTableDriftG>?> getTaskItemsFromUser(int userId);

  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet);

  Future<List<UserTableDriftG?>?> getUserItemsByTaskId(int taskId);

  Future<UserTableDriftG?> getCreatorById(int creatorId);

  Future<void> addUserItemsToTask(int taskId, List<int> userIds);

  Future<int?> addUserItemToTask(int taskId, int userId);

  Future<void> deleteUserItemsFromTask(int taskId, List<int> userId);

  Future<List<TagTableDriftG>?> getTagItemsByTaskId(int taskId);

  Future<void> addTagItemsToTask(int taskId, List<int> tagId);

  Future<void> deleteTagItemsFromTask(int taskId, List<int> tagId);

  Future<List<ReminderTableDriftG>?> getReminderItemsByTaskId(int taskId);

  Future<void> addReminderItemsToTask(int taskId, List<int> tagId);

  Future<void> deleteReminderItemsFromTask(int taskId, List<int> reminderId);
}
