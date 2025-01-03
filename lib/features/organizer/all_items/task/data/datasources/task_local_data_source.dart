import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TaskLocalDataSource {
  Future<TaskTableDriftG?> addTask(TaskTableDriftCompanion taskCompanion);

  Future<TaskTableDriftG?> updateTask(TaskTableDriftCompanion taskCompanion);

  Future<TaskUserLinkTableDriftG?> updateTaskUserLink(
      TaskUserLinkTableDriftCompanion taskCompanion);

  Future<int> deleteTask(int taskId);

  Future<List<int>?> deleteTaskItems(List<int> taskIds);

  Future<List<TaskDto>?> getTaskDtoItemsFromUser(int userId);

  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet);

  // User operations related to tasks

  Future<TaskUserLinkTableDriftG?> addTaskUserLink(
      TaskUserLinkTableDriftCompanion taskUserLinkCompanion);

  Future<List<UserTableDriftG?>?> getUserItemsByTaskId(int taskId);

  Future<UserTableDriftG?> getCreatorById(int creatorId);

  Future<void> addUserItemsFromTask(int taskId, List<int> userIds);

  Future<void> deleteUserItemsFromTask(int taskId, List<int> userIds);

  // Tag operations related to tasks

  Future<List<TagTableDriftG>?> getTagItemsByTaskId(int taskId);

  Future<void> addTagItemsToTask(int taskId, List<int> tagIds);

  Future<void> deleteTagItemsFromTask(int taskId, List<int> tagIds);

  // Reminder operations related to tasks

  Future<List<ReminderTableDriftG>?> getReminderItemsByTaskId(int taskId);

  Future<void> addReminderItemsToTask(int taskId, List<int> tagIds);

  Future<void> deleteReminderItemsFromTask(int taskId, List<int> reminderIds);
}
