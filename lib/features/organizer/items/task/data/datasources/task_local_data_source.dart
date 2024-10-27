import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TaskLocalDataSource {
  // Task CRUD operations
  Future<int> addTask(TaskTableDriftCompanion taskCompanion);

  Future<bool> updateTask(TaskTableDriftCompanion taskCompanion);

  Future<int> deleteTask(int taskId);

  Future<TaskTableDriftG?> getTaskById(int id);

  Future<List<TaskTableDriftG>?> getTaskItemsAll();

  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet);

  // User operations related to tasks
  Future<List<UserTableDriftG>?> getUserItemsByTaskId(int taskId);

  Future<UserTableDriftG?> getCreatorById(int creatorId);

  Future<int> addUserToTask(int taskId, int userId);

  Future<int> deleteUserFromTask(int taskId, int userId);

  // Tag operations related to tasks
  Future<List<TagTableDriftG>?> getTagItemsByTaskId(int taskId);

  Future<int> addTagToTask(int taskId, int tagId);

  Future<void> addTagItemsToTask(int taskId, List<int> tagId);

  Future<int> deleteTagFromTask(int taskId, int tagId);

  Future<void> deleteTagItemsFromTask(int taskId, List<int> tagId);

  // Reminder operations related to tasks
  Future<List<ReminderTableDriftG>?> getRemindersByTaskId(int taskId);

  Future<List<ReminderTableDriftG>?> getReminderItemsByTaskId(int taskId);

  Future<int> addReminderToTask(int taskId, int reminderId);

  Future<void> addReminderItemsToTask(int taskId, List<int> tagId);

  Future<int> deleteReminderFromTask(int taskId, int reminderId);

  Future<void> deleteReminderItemsFromTask(int taskId, List<int> reminderId);
}
