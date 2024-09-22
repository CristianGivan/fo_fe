import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

abstract class TaskLocalDataSource {
  // Task CRUD operations
  Future<int> insertTask(TaskTableDriftCompanion task);

  Future<bool> updateTask(TaskTableDriftCompanion task);

  Future<int> deleteTask(int taskId);

  Future<TaskTableDriftG?> getTaskById(int id);

  Future<List<TaskTableDriftG>?> getTaskItemsAll();

  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet);

  // User operations related to tasks
  Future<OrganizerItems<UserModel>> getUsersByTaskId(int taskId);

  Future<UserModel?> getCreatorById(int creatorId);

  Future<int> addUserToTask(int taskId, int userId);

  Future<int> deleteUserFromTask(int taskId, int userId);

  // Tag operations related to tasks
  Future<OrganizerItems<TagModel>> getTagsByTaskId(int taskId);

  Future<int> addTagToTask(int taskId, int tagId);

  Future<void> addTagItemsToTask(int taskId, List<int> tagId);

  Future<int> deleteTagFromTask(int taskId, int tagId);

  // Reminder operations related to tasks
  Future<OrganizerItems<ReminderModel>> getRemindersByTaskId(int taskId);

  Future<int> addReminderToTask(int taskId, int reminderId);

  Future<int> deleteReminderFromTask(int taskId, int reminderId);
}
