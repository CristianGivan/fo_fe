// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final OrganizerDriftDB db;

  TaskLocalDataSourceDrift({
    required this.db,
  });

  // CRUD operations
  @override
  Future<int> addTask(TaskTableDriftCompanion taskCompanion) {
    return db.taskDaoDrift.addTask(taskCompanion);
  }

  @override
  Future<bool> updateTask(TaskTableDriftCompanion taskCompanion) {
    return db.taskDaoDrift.updateTask(taskCompanion);
  }

  @override
  Future<int> deleteTask(int taskId) {
    return db.taskDaoDrift.deleteTask(taskId);
  }

  // Get task by ID without related entities
  @override
  Future<TaskTableDriftG?> getTaskById(int id) async {
    return await db.taskDaoDrift.getTaskById(id);
  }

  //
  // // Get full lazy-loaded task by ID with all related entities
  // @override
  // Future<TaskModelLazyLoaded?> getTaskByIdLazyLoaded(int id) async {
  //   final taskTable = await db.taskDaoDrift.getTaskById(id);
  //   if (taskTable == null) return null;
  //
  //   final creator = taskTable.creatorId != null
  //       ? await db.userDaoDrift.getUserById(taskTable.creatorId!)
  //       : null;
  //
  //   final userIds = await db.taskUserLinkDaoDrift.getUserIdsByTaskId(id);
  //   final userTables = await db.userDaoDrift.getUserItemsByIdSet(userIds);
  //   final users = UserMapper.modelItemsFromTableDriftItems(userTables);
  //
  //   final tagIds = await db.taskTagLinkDaoDrift.getTagIdsByTaskId(id);
  //   final tagTables = await db.tagDaoDrift.getTagItemsByTagIdSet(tagIds);
  //   final tags = TagMapper.modelItemsFromTableDriftItems(tagTables);
  //
  //   final reminderIds =
  //       await db.taskReminderLinkDaoDrift.getReminderIdsByTaskId(id);
  //   final reminderTables =
  //       await db.reminderDaoDrift.getReminderItemsByReminderIdSet(reminderIds);
  //   final reminders =
  //       ReminderMapper.modelItemsFromTableDriftItems(reminderTables);
  //
  //   return TaskMapper.toLazyLoadedModel(
  //     taskTable,
  //     creator != null ? UserMapper.modelFromTableDrift(creator) : null,
  //     users,
  //     tags,
  //     reminders,
  //   );
  // }

  // Get all task items
  @override
  Future<List<TaskTableDriftG>?> getTaskItemsAll() async {
    return await db.taskDaoDrift.getTaskItemsAll();
  }

  // Get task items by ID set
  @override
  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet) async {
    return await db.taskDaoDrift.getTaskItemsByIdSet(idSet.toSet());
  }

  // Method to get users by task ID
  @override
  Future<List<UserTableDriftG>?> getUserItemsByTaskId(int taskId) async {
    final userIds = await db.taskUserLinkDaoDrift.getUserIdsByTaskId(taskId);
    return await db.userDaoDrift.getUserItemsByIdSet(userIds);
  }

  // Method to get tags by task ID
  @override
  Future<List<TagTableDriftG>?> getTagItemsByTaskId(int taskId) async {
    final tagIds = await db.taskTagLinkDaoDrift.getTagIdsByTaskId(taskId);
    return await db.tagDaoDrift.getTagItemsByTagIdSet(tagIds);
  }

  // Method to get reminders by task ID
  @override
  Future<List<ReminderTableDriftG>?> getRemindersByTaskId(int taskId) async {
    final reminderIds =
        await db.taskReminderLinkDaoDrift.getReminderIdsByTaskId(taskId);
    return await db.reminderDaoDrift
        .getReminderItemsByReminderIdSet(reminderIds);
  }

  // Method to get creator by ID
  @override
  Future<UserTableDriftG?> getCreatorById(int creatorId) async {
    return await db.userDaoDrift.getUserById(creatorId);
  }

  // Add user to task
  @override
  Future<int> addUserToTask(int taskId, int userId) async {
    return db.taskUserLinkDaoDrift
        .addTaskUser(_createTaskUserCompanion(taskId, userId));
  }

  // Add tag to task
  @override
  Future<int> addTagToTask(int taskId, int tagId) async {
    return db.taskTagLinkDaoDrift
        .addTaskTag(_createTaskTagCompanion(taskId, tagId));
  }

  Future<void> addTagItemsToTask(int taskId, List<int> tags) async {
    await db.transaction(() async {
      for (final tagId in tags) {
        await db.taskTagLinkDaoDrift
            .addTaskTag(_createTaskTagCompanion(taskId, tagId));
      }
    });
  }

  // Add reminder to task
  @override
  Future<int> addReminderToTask(int taskId, int reminderId) async {
    return db.taskReminderLinkDaoDrift
        .addTaskReminder(_createTaskReminderCompanion(taskId, reminderId));
  }

// Delete user from task
  @override
  Future<int> deleteUserFromTask(int taskId, int userId) async {
    return db.taskUserLinkDaoDrift.deleteTaskUser(taskId, userId);
  }

  // Delete tag from task
  @override
  Future<int> deleteTagFromTask(int taskId, int tagId) async {
    return db.taskTagLinkDaoDrift.deleteTaskTag(taskId, tagId);
  }

  // Delete reminder from task
  @override
  Future<int> deleteReminderFromTask(taskId, reminderId) async {
    return db.taskReminderLinkDaoDrift.deleteTaskReminder(taskId, reminderId);
  }

  TaskTagLinkTableDriftCompanion _createTaskTagCompanion(
      int taskId, int tagId) {
    return TaskTagLinkTableDriftCompanion(
      taskId: Value(taskId),
      tagId: Value(tagId),
    );
  }

  TaskReminderLinkTableDriftCompanion _createTaskReminderCompanion(
      int taskId, int reminderId) {
    return TaskReminderLinkTableDriftCompanion(
      taskId: Value(taskId),
      reminderId: Value(reminderId),
    );
  }

  TaskUserLinkTableDriftCompanion _createTaskUserCompanion(
      int taskId, int userId) {
    return TaskUserLinkTableDriftCompanion(
      taskId: Value(taskId),
      userId: Value(userId),
    );
  }
}
