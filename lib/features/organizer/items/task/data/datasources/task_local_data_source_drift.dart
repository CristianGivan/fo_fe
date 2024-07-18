// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer/task/task_reminder_dao_drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/reminder/reminder_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/items/task/data/models/task_model.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

import '../../../../../../core/util/organizer/core_util_organizer.dart';
import '../models/task_mapper.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final TaskDaoDrift taskDao;
  final TagDaoDrift tagDao;
  final ReminderDaoDrift reminderDao;
  final UserDaoDrift userDao;
  final TaskTagDaoDrift taskTagDao;
  final TaskReminderDaoDrift taskReminderDao;
  final TaskUserDaoDrift taskUserDao;

  TaskLocalDataSourceDrift({
    required this.taskDao,
    required this.tagDao,
    required this.reminderDao,
    required this.userDao,
    required this.taskTagDao,
    required this.taskReminderDao,
    required this.taskUserDao,
  });

  // CRUD operations
  Future<int> insertTask(TaskTableDriftCompanion task) {
    return taskDao.insertTask(task);
  }

  Future<bool> updateTask(TaskTableDriftCompanion task) {
    return taskDao.updateTask(task);
  }

  Future<int> deleteTask(int taskId) {
    return taskDao.deleteTask(taskId);
  }

  // Get task by ID without related entities
  Future<TaskModel?> getTaskById(int id) async {
    final taskTable = await taskDao.getTaskById(id);
    return taskTable != null ? TaskMapper.modelFromTableDrift(taskTable) : null;
  }

  // Get full lazy-loaded task by ID with all related entities
  Future<TaskModelLazyLoaded?> getTaskByIdLazyLoaded(int id) async {
    final taskTable = await taskDao.getTaskById(id);
    if (taskTable == null) return null;

    final creator = taskTable.creatorId != null
        ? await userDao.getUserById(taskTable.creatorId!)
        : null;

    final userIds = await taskUserDao.getUserIdsByTaskId(id);
    final userTables = await userDao.getUserItemsByIds(userIds);
    final users = UserMapper.modelItemsFromTableDriftItems(userTables);

    final tagIds = await taskTagDao.getTagIdsByTaskId(id);
    final tagTables = await tagDao.getTagItemsByTagIds(tagIds);
    final tags = TagMapper.modelItemsFromTableDriftItems(tagTables);

    final reminderIds = await taskReminderDao.getReminderIdsByTaskId(id);
    final reminderTables = await reminderDao.getRemindersByTaskId(reminderIds);
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
    final taskTables = await taskDao.getTaskItemsAll();
    return TaskMapper.modelItemsFromTableDriftItems(taskTables);
  }

  // Get task items by ID set
  Future<OrganizerItems<TaskModel>> getTaskItemsByIdSet(IdSet idSet) async {
    final taskTables = await taskDao.getTaskItemsByIdSet(idSet.toSet());
    return TaskMapper.modelItemsFromTableDriftItems(taskTables);
  }

  // Method to get users by task ID
  Future<OrganizerItems<UserModel>> getUsersByTaskId(int taskId) async {
    final userIds = await taskUserDao.getUserIdsByTaskId(taskId);
    final userTables = await userDao.getUserItemsByIds(userIds);
    return UserMapper.modelItemsFromTableDriftItems(userTables);
  }

  // Method to get tags by task ID
  Future<OrganizerItems<TagModel>> getTagsByTaskId(int taskId) async {
    final tagIds = await taskTagDao.getTagIdsByTaskId(taskId);
    final tagTables = await tagDao.getTagItemsByTagIds(tagIds);
    return TagMapper.modelItemsFromTableDriftItems(tagTables);
  }

  // Method to get reminders by task ID
  Future<OrganizerItems<ReminderModel>> getRemindersByTaskId(int taskId) async {
    final reminderIds = await taskReminderDao.getReminderIdsByTaskId(taskId);
    final reminderTables = await reminderDao.getRemindersByTaskId(reminderIds);
    return ReminderMapper.modelItemsFromTableDriftItems(reminderTables);
  }

  // Method to get creator by ID
  Future<UserModel?> getCreatorById(int creatorId) async {
    final creator = await userDao.getUserById(creatorId);
    return creator != null ? UserMapper.modelFromTableDrift(creator) : null;
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
  Future<int> addReminderToTask(int taskId, int reminderId) async {
    return taskReminderDao
        .insertTaskReminder(_createTaskReminderCompanion(taskId, reminderId));
  }

// Delete user from task
  Future<int> deleteUserFromTask(int taskId, int userId) async {
    return taskUserDao.deleteTaskUser(taskId, userId);
  }

  // Delete tag from task
  Future<int> deleteTagFromTask(int taskId, int tagId) async {
    return taskTagDao.deleteTaskTag(taskId, tagId);
  }

  // Delete reminder from task
  Future<int> deleteReminderFromTask(taskId, reminderId) async {
    return taskReminderDao.deleteTaskReminder(taskId, reminderId);
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
