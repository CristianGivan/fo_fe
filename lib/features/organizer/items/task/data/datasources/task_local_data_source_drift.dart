// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_model.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

import '../../../../../../core/util/organizer/core_util_organizer.dart';
import '../models/task_mapper.dart';

class TaskDataSource {
  final TaskDaoDrift taskDao;
  final TagDaoDrift tagDao;
  final UserDaoDrift userDao;
  final TaskUserDaoDrift taskUserDao;
  final TaskTagDaoDrift taskTagDao;
  final ReminderDaoDrift reminderDao;

  TaskDataSource({
    required this.taskDao,
    required this.tagDao,
    required this.userDao,
    required this.taskUserDao,
    required this.taskTagDao,
    required this.reminderDao,
  });

  // CRUD operations
  Future<int> insertTask(TaskTableDriftCompanion task) {
    return taskDao.insertTask(task);
  }

  Future<bool> updateTask(TaskTableDriftCompanion task) {
    return taskDao.updateTask(task);
  }

  Future<int> deleteTask(TaskTableDriftCompanion task) {
    return taskDao.deleteTask(task);
  }

  // Get task by ID without related entities
  Future<TaskModel?> getTaskById(int id) async {
    final taskTable = await taskDao.getTaskById(id);
    return taskTable != null ? TaskMapper.fromTableDrift(taskTable) : null;
  }

  // Get full lazy-loaded task by ID with all related entities
  Future<TaskModelLazyLoaded?> getTaskByIdLazyLoaded(int id) async {
    final taskTable = await taskDao.getTaskById(id);
    if (taskTable == null) return null;

    final creator = taskTable.creatorId != null
        ? await userDao.getUserById(taskTable.creatorId!)
        : null;

    final userIds = await taskUserDao.getUserIdsByTaskId(id);
    final userTables = await userDao.getUserListByUserIds(userIds);
    final users = userTables.map(UserMapper.fromTableDrift).toList();

    final tagIds = await taskTagDao.getTagIdsByTaskId(id);
    final tagTables = await tagDao.getTagItemsByTagIds(tagIds);
    final tags = tagTables.map(TagMapper.fromTableDrift).toList();

    final reminderTables = await reminderDao.getRemindersByTaskId(id);
    final reminders =
        reminderTables.map(ReminderMapper.fromTableDrift).toList();

    return TaskMapper.toLazyLoadedModel(
      taskTable,
      creator != null ? UserMapper.fromTableDrift(creator) : null,
      users,
      tags,
      reminders,
    );
  }

  // Get all task items
  Future<List<TaskModel>> getTaskItemsAll() async {
    final taskTables = await taskDao.getTaskItemsAll();
    return taskTables.map(TaskMapper.fromTableDrift).toList();
  }

  // Get task items by ID set
  Future<List<TaskModel>> getTaskItemsByIdSet(IdSet idSet) async {
    final taskTables = await taskDao.getTaskItemsByIdSet(idSet);
    return taskTables.map(TaskMapper.fromTableDrift).toList();
  }

  // Method to get users by task ID
  Future<List<UserModel>> getUsersByTaskId(int taskId) async {
    final userIds = await taskUserDao.getUserIdsByTaskId(taskId);
    final userTables = await userDao.getUserListByUserIds(userIds);
    return userTables.map(UserMapper.fromTableDrift).toList();
  }

  // Method to get tags by task ID
  Future<List<TagModel>> getTagsByTaskId(int taskId) async {
    final tagIds = await taskTagDao.getTagIdsByTaskId(taskId);
    final tagTables = await tagDao.getTagItemsByTagIds(tagIds);
    return tagTables.map(TagMapper.fromTableDrift).toList();
  }

  // Method to get reminders by task ID
  Future<List<ReminderModel>> getRemindersByTaskId(int taskId) async {
    final reminderTables = await reminderDao.getRemindersByTaskId(taskId);
    return reminderTables.map(ReminderMapper.fromTableDrift).toList();
  }

  // Method to get creator by ID
  Future<UserModel?> getCreatorById(int creatorId) async {
    final creator = await userDao.getUserById(creatorId);
    return creator != null ? UserMapper.fromTableDrift(creator) : null;
  }

  // Add user to task
  Future<int> addUserToTask(int taskId, int userId) async {
    return taskUserDao.insertTaskUser(_createTaskUserCompanion(taskId, userId));
  }

  // Add tag to task
  Future<int> addTagToTask(int taskId, int tagId) async {
    return taskTagDao.insertTaskTag(_createTaskTagCompanion(taskId, tagId));
  }

  // Add reminder to task
  Future<int> addReminderToTask(ReminderTableDriftCompanion reminder) async {
    return reminderDao.insertReminder(reminder);
  }

// Delete user from task
  Future<int> deleteUserFromTask(int taskId, int userId) async {
    return taskUserDao.deleteTaskUser(_createTaskUserCompanion(taskId, userId));
  }

  // Delete tag from task
  Future<int> deleteTagFromTask(int taskId, int tagId) async {
    return taskTagDao.deleteTaskTag(_createTaskTagCompanion(taskId, tagId));
  }

  // Delete reminder from task
  Future<int> deleteReminderFromTask(int reminderId) async {
    final reminder = ReminderTableDriftCompanion(
      id: Value(reminderId),
    );
    return reminderDao.deleteReminder(reminder);
  }

  TaskTagTableDriftCompanion _createTaskTagCompanion(int taskId, int tagId) {
    return TaskTagTableDriftCompanion(
      taskId: Value(taskId),
      tagId: Value(tagId),
    );
  }

  TaskUserTableDriftCompanion _createTaskUserCompanion(int taskId, int userId) {
    return TaskUserTableDriftCompanion(
      taskId: Value(taskId),
      userId: Value(userId),
    );
  }
}
