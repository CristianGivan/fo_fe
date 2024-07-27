// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/reminder/config/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_model.dart';
import 'package:fo_fe/features/organizer/items/user/config/user_exports.dart';

import '../models/task_mapper.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final OrganizerDriftDB db;

  TaskLocalDataSourceDrift({
    required this.db,
  });

  // CRUD operations
  Future<int> insertTask(TaskTableDriftCompanion task) {
    return db.taskDaoDrift.insertTask(task);
  }

  Future<bool> updateTask(TaskTableDriftCompanion task) {
    return db.taskDaoDrift.updateTask(task);
  }

  Future<int> deleteTask(int taskId) {
    return db.taskDaoDrift.deleteTask(taskId);
  }

  // Get task by ID without related entities
  Future<TaskModel?> getTaskById(int id) async {
    final taskTable = await db.taskDaoDrift.getTaskById(id);
    return taskTable != null ? TaskMapper.modelFromTableDrift(taskTable) : null;
  }

  // Get full lazy-loaded task by ID with all related entities
  Future<TaskModelLazyLoaded?> getTaskByIdLazyLoaded(int id) async {
    final taskTable = await db.taskDaoDrift.getTaskById(id);
    if (taskTable == null) return null;

    final creator = taskTable.creatorId != null
        ? await db.userDaoDrift.getUserById(taskTable.creatorId!)
        : null;

    final userIds = await db.taskUserDaoDrift.getUserIdsByTaskId(id);
    final userTables = await db.userDaoDrift.getUserItemsByIdSet(userIds);
    final users = UserMapper.modelItemsFromTableDriftItems(userTables);

    final tagIds = await db.taskTagDaoDrift.getTagIdsByTaskId(id);
    final tagTables = await db.tagDaoDrift.getTagItemsByTagIdSet(tagIds);
    final tags = TagMapper.modelItemsFromTableDriftItems(tagTables);

    final reminderIds =
        await db.taskReminderDaoDrift.getReminderIdsByTaskId(id);
    final reminderTables =
        await db.reminderDaoDrift.getReminderItemsByReminderIdSet(reminderIds);
    final reminders =
        ReminderMapper.modelItemsFromTableDriftItems(reminderTables);

    return TaskMapper.toLazyLoadedModel(
      taskTable,
      creator != null ? UserMapper.modelFromTableDrift(creator) : null,
      users,
      tags,
      reminders,
    );
  }

  // Get all task items
  Future<OrganizerItems<TaskModel>> getTaskItemsAll() async {
    final taskTables = await db.taskDaoDrift.getTaskItemsAll();
    return TaskMapper.modelItemsFromTableDriftItems(taskTables);
  }

  // Get task items by ID set
  Future<OrganizerItems<TaskModel>> getTaskItemsByIdSet(IdSet idSet) async {
    final taskTables = await db.taskDaoDrift.getTaskItemsByIdSet(idSet.toSet());
    return TaskMapper.modelItemsFromTableDriftItems(taskTables);
  }

  // Method to get users by task ID
  Future<OrganizerItems<UserModel>> getUsersByTaskId(int taskId) async {
    final userIds = await db.taskUserDaoDrift.getUserIdsByTaskId(taskId);
    final userTables = await db.userDaoDrift.getUserItemsByIdSet(userIds);
    return UserMapper.modelItemsFromTableDriftItems(userTables);
  }

  // Method to get tags by task ID
  Future<OrganizerItems<TagModel>> getTagsByTaskId(int taskId) async {
    final tagIds = await db.taskTagDaoDrift.getTagIdsByTaskId(taskId);
    final tagTables = await db.tagDaoDrift.getTagItemsByTagIdSet(tagIds);
    return TagMapper.modelItemsFromTableDriftItems(tagTables);
  }

  // Method to get reminders by task ID
  Future<OrganizerItems<ReminderModel>> getRemindersByTaskId(int taskId) async {
    final reminderIds =
        await db.taskReminderDaoDrift.getReminderIdsByTaskId(taskId);
    final reminderTables =
        await db.reminderDaoDrift.getReminderItemsByReminderIdSet(reminderIds);
    return ReminderMapper.modelItemsFromTableDriftItems(reminderTables);
  }

  // Method to get creator by ID
  Future<UserModel?> getCreatorById(int creatorId) async {
    final creator = await db.userDaoDrift.getUserById(creatorId);
    return creator != null ? UserMapper.modelFromTableDrift(creator) : null;
  }

  // Add user to task
  Future<int> addUserToTask(int taskId, int userId) async {
    return db.taskUserDaoDrift
        .insertTaskUser(_createTaskUserCompanion(taskId, userId));
  }

  // Add tag to task
  Future<int> addTagToTask(int taskId, int tagId) async {
    return db.taskTagDaoDrift
        .insertTaskTag(_createTaskTagCompanion(taskId, tagId));
  }

  // Add reminder to task
  Future<int> addReminderToTask(int taskId, int reminderId) async {
    return db.taskReminderDaoDrift
        .insertTaskReminder(_createTaskReminderCompanion(taskId, reminderId));
  }

// Delete user from task
  Future<int> deleteUserFromTask(int taskId, int userId) async {
    return db.taskUserDaoDrift.deleteTaskUser(taskId, userId);
  }

  // Delete tag from task
  Future<int> deleteTagFromTask(int taskId, int tagId) async {
    return db.taskTagDaoDrift.deleteTaskTag(taskId, tagId);
  }

  // Delete reminder from task
  Future<int> deleteReminderFromTask(taskId, reminderId) async {
    return db.taskReminderDaoDrift.deleteTaskReminder(taskId, reminderId);
  }

  TaskTagTableDriftCompanion _createTaskTagCompanion(int taskId, int tagId) {
    return TaskTagTableDriftCompanion(
      taskId: Value(taskId),
      tagId: Value(tagId),
    );
  }

  TaskReminderTableDriftCompanion _createTaskReminderCompanion(
      int taskId, int reminderId) {
    return TaskReminderTableDriftCompanion(
      taskId: Value(taskId),
      reminderId: Value(reminderId),
    );
  }

  TaskUserTableDriftCompanion _createTaskUserCompanion(int taskId, int userId) {
    return TaskUserTableDriftCompanion(
      taskId: Value(taskId),
      userId: Value(userId),
    );
  }
}
