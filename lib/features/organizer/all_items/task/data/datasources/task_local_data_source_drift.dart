// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/utils/set_and_list/id_set.dart';

import '../../utils/task_exports.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final OrganizerDriftDB db;

  TaskLocalDataSourceDrift({
    required this.db,
  });

  @override
  Future<TaskTableDriftG?> addTask(TaskTableDriftCompanion taskCompanion) async {
    final taskId = await db.taskDaoDrift.addTask(taskCompanion);
    return getTaskById(taskId);
  }

  @override
  Future<TaskUserLinkTableDriftG?> addTaskUserLink(
      TaskUserLinkTableDriftCompanion companion) async {
    final taskUserLinkId = await db.taskUserLinkDaoDrift.addTaskUser(companion);
    return _getTaskUserLinkById(taskUserLinkId);
  }

  @override
  Future<TaskTableDriftG?> updateTask(TaskTableDriftCompanion taskCompanion) async {
    await db.taskDaoDrift.updateTask(taskCompanion);
    return getTaskById(taskCompanion.id.value);
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
  Future<Set<int>?> deleteTaskItems(Set<int> taskIds) async {
    return await db.transaction(() async {
      //find all related taskUserLinks, taskTagLinks, taskReminderLinks and delete them first
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
  Future<TaskTableDriftG?> getTaskById(int id) async {
    return await db.taskDaoDrift.getTaskById(id);
  }

  @override
  Future<List<TaskTableDriftG>?> getTaskItemsAll() async {
    return await db.taskDaoDrift.getTaskItemsAll();
  }

  @override
  Future<List<TaskTableDriftG>?> getTaskItemsFromUser(int userId) async {
    return await db.transaction(() async {
      final taskIds = await db.taskUserLinkDaoDrift.getTaskIdsByUserId(userId);
      final tasks = await db.taskDaoDrift.getTaskItemsByIdSet(taskIds);
      return tasks?.whereType<TaskTableDriftG>().toList();
    });
  }

  @override
  Future<List<TaskDto>?> getTaskDtoItemsFromUser(int userId) async {
    final taskList = await db.taskDaoDrift.getTaskDtoItemsFromUser(userId);
    return taskList
        ?.map((row) => TaskDto(
              task: rowToTaskEntity(row),
              taskUserLink: rowToTaskUserEntity(row),
            ))
        .toList();
  }

  @override
  Future<List<TaskTableDriftG?>?> getTaskItemsByIdSet(IdSet idSet) async {
    return await db.taskDaoDrift.getTaskItemsByIdSet(idSet.toSet());
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
  Future<void> deleteUserItemsFromTask(int taskId, List<int> userItems) async {
    await db.transaction(() async {
      for (final tagId in userItems) {
        await db.taskUserLinkDaoDrift.deleteTaskUser(taskId, tagId);
      }
    });
  }

  //Reminder
  @override
  Future<List<ReminderTableDriftG>?> getReminderItemsByTaskId(int taskId) async {
    final reminderIds = await db.taskReminderLinkDaoDrift.getReminderIdsByTaskId(taskId);
    return await db.reminderDaoDrift.getReminderItemsByReminderIdSet(reminderIds);
  }

  @override
  Future<void> addReminderItemsToTask(int taskId, List<int> reminderItems) async {
    await db.transaction(() async {
      for (final tagId in reminderItems) {
        await db.taskReminderLinkDaoDrift
            .addTaskReminder(_createTaskReminderCompanion(taskId, tagId));
      }
    });
  }

  @override
  Future<void> deleteReminderItemsFromTask(int taskId, List<int> reminderItems) async {
    await db.transaction(() async {
      for (final tagId in reminderItems) {
        await db.taskReminderLinkDaoDrift.deleteTaskReminder(taskId, tagId);
      }
    });
  }

// Tags of task
  @override
  Future<List<TagTableDriftG>?> getTagItemsByTaskId(int taskId) async {
    final tagIds = await db.taskTagLinkDaoDrift.getTagIdsByTaskId(taskId);
    return await db.tagDaoDrift.getTagItemsByTagIdSet(tagIds);
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

  TaskTagLinkTableDriftCompanion _createTaskTagCompanion(int taskId, int tagId) {
    return TaskTagLinkTableDriftCompanion(
      taskId: Value(taskId),
      tagId: Value(tagId),
    );
  }

  TaskReminderLinkTableDriftCompanion _createTaskReminderCompanion(int taskId, int reminderId) {
    return TaskReminderLinkTableDriftCompanion(
      taskId: Value(taskId),
      reminderId: Value(reminderId),
    );
  }

  TaskUserLinkTableDriftCompanion _createTaskUserCompanion(int taskId, int userId) {
    return TaskUserLinkTableDriftCompanion(
      taskId: Value(taskId),
      userId: Value(userId),
    );
  }

  List<TaskDto> dtoItemsFromQueryResult(List<TypedResult> items) {
    return items.map((row) {
      final taskRow = row.readTable(db.taskTableDrift);
      final taskUserLinkRow = row.readTableOrNull(db.taskUserLinkTableDrift);

      return TaskDto(
        task: TaskEntity(
          id: taskRow.id,
          remoteId: taskRow.remoteId,
          subject: taskRow.subject,
          startDate: taskRow.startDate,
          endDate: taskRow.endDate,
          workingTime: taskRow.workingTime,
          estimatedTime: taskRow.estimatedTime,
          estimatedLeftTime: taskRow.estimatedLeftTime,
          workingProgress: taskRow.workingProgress,
          taskStatus: taskStatusMap[taskRow.taskStatus],
        ),
        taskUserLink: TaskUserLinkEntity(
          id: taskUserLinkRow?.id ?? 0,
          linkingDate: taskUserLinkRow?.linkingDate ?? DateTime.now(),
          taskId: taskUserLinkRow?.taskId ?? 0,
          userId: taskUserLinkRow?.userId ?? 0,
          selectedByUser: taskUserLinkRow?.selectedByUser ?? false,
          orderedByUser: taskUserLinkRow?.orderedByUser ?? double.maxFinite.toInt(),
        ),
      );
    }).toList();
  }

  TaskEntity rowToTaskEntity(QueryRow row) {
    return TaskEntity(
      id: row.read<int>('id'),
      subject: row.read<String>('subject'),
      startDate: row.read<DateTime>('start_date'),
      endDate: row.read<DateTime>('end_date'),
      workingTime: row.read<double>('working_time'),
      estimatedTime: row.read<double>('estimated_time'),
      estimatedLeftTime: row.read<double>('estimated_left_time'),
      workingProgress: row.read<double>('working_progress'),
      taskStatus: taskStatusMap[row.read<String>('task_status')],
      createdDate: row.read<DateTime>('created_date'),
      creatorId: row.read<int>('creator_id'),
      remoteId: row.read<int>('remote_id'),
      lastUpdate: row.read<DateTime>('last_update'),
      lastAccessedDate: row.read<DateTime>('last_accessed_date'),
      remoteAccesses: row.read<int>('remote_accesses'),
      accesses: row.read<int>('accesses'),
      checksum: row.read<String>('checksum'),
    );
  }

  TaskUserLinkEntity rowToTaskUserEntity(QueryRow row) {
    return TaskUserLinkEntity(
      id: row.read<int>('id'),
      linkingDate: row.read<DateTime>('linking_date'),
      taskId: row.read<int>('task_id'),
      userId: row.read<int>('user_id'),
      selectedByUser: row.read<bool>('selected_by_user'),
      orderedByUser: row.read<int>('ordered_by_user'),
    );
  }

  Future<TaskUserLinkTableDriftG?> _getTaskUserLinkById(int taskUserLinkId) async {
    return await db.taskUserLinkDaoDrift.getTaskUserById(taskUserLinkId);
  }
}
