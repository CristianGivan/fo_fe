// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/id_set.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final OrganizerDriftDB db;

  TaskLocalDataSourceDrift({
    required this.db,
  });

  @override
  Future<TaskTableDriftG?> addTask(TaskTableDriftCompanion taskCompanion) async {
    final taskId = await db.taskDaoDrift.addTask(taskCompanion);
    return _getTaskById(taskId);
  }

  @override
  Future<TaskTableDriftG?> updateTask(TaskTableDriftCompanion taskCompanion) async {
    await db.taskDaoDrift.updateTask(taskCompanion);
    return _getTaskById(taskCompanion.id.value);
  }

  @override
  Future<TaskUserLinkTableDriftG?> updateTaskUserLink(
      TaskUserLinkTableDriftCompanion companion) async {
    await db.taskUserLinkDaoDrift.updateTaskUserLink(companion);
    return _getTaskUserLinkById(companion.id.value);
  }

  @override
  Future<int> deleteTask(int taskId) {
    return db.taskDaoDrift.deleteTask(taskId);
  }

  @override
  Future<List<int>?> deleteTaskItems(List<int> taskIds) async {
    return await db.transaction(() async {
      //find all related taskUserLinks, taskTagLinks, taskReminderLinks and delete them first and
      // return the relevant ids
      for (final taskId in taskIds) {
        await db.taskUserLinkDaoDrift.deleteTaskUserByTaskId(taskId);
        await db.taskTagLinkDaoDrift.deleteTaskTagByTaskId(taskId);
        await db.taskReminderLinkDaoDrift.deleteTaskReminderByTaskId(taskId);
        await db.taskDaoDrift.deleteTask(taskId);
      }
      //todo -implement- return the deleted taskIds
      return taskIds;
    });
  }

  @override
  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet) async {
    return await db.taskDaoDrift.getTaskItemsByIdSet(idSet.toSet());
  }

  @override
  Future<List<QueryRow>?> getTaskItemsFromUser(int userId) async {
    return await db.taskDaoDrift.getTaskDtoItemsFromUser(userId);
  }

// User operations related to tasks

  @override
  Future<TaskUserLinkTableDriftG?> addTaskUserLink(
      TaskUserLinkTableDriftCompanion companion) async {
    final taskUserLinkId = await db.taskUserLinkDaoDrift.addTaskUser(companion);
    return _getTaskUserLinkById(taskUserLinkId);
  }

  @override
  Future<UserTableDriftG?> getCreatorById(int creatorId) async {
    return await db.userDaoDrift.getUserById(creatorId);
  }

  @override
  Future<List<UserTableDriftG?>?> getUserItemsByTaskId(int taskId) async {
    final userIds = await db.taskUserLinkDaoDrift.getUserIdsByTaskId(taskId);
    return await db.userDaoDrift.getUserItemsByIdSet(userIds);
  }

  @override
  Future<void> addUserItemsFromTask(int taskId, List<int> userItems) async {
    await db.transaction(() async {
      for (final userId in userItems) {
        await db.taskUserLinkDaoDrift.addTaskUser(_createSelectedTaskUserCompanion(taskId, userId));
      }
    });
  }

  @override
  Future<void> deleteUserItemsFromTask(int taskId, List<int> userItems) async {
    await db.transaction(() async {
      for (final tagId in userItems) {
        await db.taskUserLinkDaoDrift.deleteTaskUser(taskId, tagId);
      }
    });
  }

  // Tags of task
  @override
  Future<List<TagTableDriftG?>?> getTagItemsByTaskId(int taskId) async {
    final tagIds = await db.taskTagLinkDaoDrift.getTagIdsByTaskId(taskId);

    return db.tagDaoDrift.getTagItemsByIdSet(tagIds);
  }

  @override
  Future<void> addTagItemsToTask(int taskId, List<int> tagItems) async {
    await db.transaction(() async {
      for (final tagId in tagItems) {
        await db.taskTagLinkDaoDrift.addTaskTag(_createTaskTagCompanion(taskId, tagId));
      }
    });
  }

  @override
  Future<void> deleteTagItemsFromTask(int taskId, List<int> tags) async {
    await db.transaction(() async {
      for (final tagId in tags) {
        await db.taskTagLinkDaoDrift.deleteTaskTag(taskId, tagId);
      }
    });
  }

  //Reminder operations related to tasks

  @override
  Future<List<ReminderTableDriftG>?> getReminderItemsByTaskId(int taskId) async {
    final reminderIds = await db.taskReminderLinkDaoDrift.getReminderIdsByTaskId(taskId);
    return await db.reminderDaoDrift.getReminderItemsByReminderIdSet(reminderIds);
  }

  @override
  Future<void> addReminderItemsToTask(int taskId, List<int> reminderItems) async {
    await db.transaction(() async {
      for (final reminderId in reminderItems) {
        await db.taskReminderLinkDaoDrift
            .addTaskReminder(_createTaskReminderCompanion(taskId, reminderId));
      }
    });
  }

  @override
  Future<void> deleteReminderItemsFromTask(int taskId, List<int> reminderItems) async {
    await db.transaction(() async {
      for (final reminderId in reminderItems) {
        await db.taskReminderLinkDaoDrift.deleteTaskReminder(taskId, reminderId);
      }
    });
  }

  Future<TaskTableDriftG?> _getTaskById(int id) async {
    return await db.taskDaoDrift.getTaskById(id);
  }

  TaskTagLinkTableDriftCompanion _createTaskTagCompanion(int taskId, int tagId) {
    return TaskTagLinkTableDriftCompanion(
      id: Value.absent(),
      taskId: Value(taskId),
      tagId: Value(tagId),
      linkingDate: Value(DateTime.now()),
    );
  }

  TaskReminderLinkTableDriftCompanion _createTaskReminderCompanion(int taskId, int reminderId) {
    return TaskReminderLinkTableDriftCompanion(
      id: Value.absent(),
      taskId: Value(taskId),
      reminderId: Value(reminderId),
      linkingDate: Value(DateTime.now()),
    );
  }

  TaskUserLinkTableDriftCompanion _createSelectedTaskUserCompanion(int taskId, int userId) {
    return TaskUserLinkTableDriftCompanion(
      id: Value.absent(),
      taskId: Value(taskId),
      userId: Value(userId),
      linkingDate: Value(DateTime.now()),
    );
  }

  Future<TaskUserLinkTableDriftG?> _getTaskUserLinkById(int taskUserLinkId) async {
    return await db.taskUserLinkDaoDrift.getTaskUserById(taskUserLinkId);
  }
}
