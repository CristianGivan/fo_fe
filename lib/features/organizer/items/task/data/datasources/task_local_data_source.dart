import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_model.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

import '../../../../../../core/util/organizer/core_util_organizer.dart';

abstract class TaskLocalDataSource {
  // Task CRUD operations
  Future<int> insertTask(TaskTableDriftCompanion task);

  Future<bool> updateTask(TaskTableDriftCompanion task);

  Future<int> deleteTask(int taskId);

  Future<TaskModel?> getTaskById(int id);

  Future<TaskModelLazyLoaded?> getTaskByIdLazyLoaded(int id);

  Future<OrganizerItems<TaskModel>> getTaskItemsAll();

  Future<OrganizerItems<TaskModel>> getTaskItemsByIdSet(IdSet idSet);

  // User operations related to tasks
  Future<OrganizerItems<UserModel>> getUsersByTaskId(int taskId);

  Future<UserModel?> getCreatorById(int creatorId);

  Future<int> addUserToTask(int taskId, int userId);

  Future<int> deleteUserFromTask(int taskId, int userId);

  // Tag operations related to tasks
  Future<OrganizerItems<TagModel>> getTagsByTaskId(int taskId);

  Future<int> addTagToTask(int taskId, int tagId);

  Future<int> deleteTagFromTask(int taskId, int tagId);

  // Reminder operations related to tasks
  Future<OrganizerItems<ReminderModel>> getRemindersByTaskId(int taskId);

  Future<int> addReminderToTask(int taskId, int reminderId);

  Future<int> deleteReminderFromTask(int taskId, int reminderId);
}
