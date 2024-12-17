// task_data_source.dart

import 'package:drift/drift.dart';
import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';
import 'package:fo_fe/features/organizer/items/task/data/datasources/task_local_data_source.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../utils/task_exports.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final OrganizerDriftDB db;

  TaskLocalDataSourceDrift({
    required this.db,
  });

  @override
  Future<TaskTableDriftG?> addTaskAndLinkCreator(TaskTableDriftCompanion taskCompanion) async {
    return await db.transaction(() async {
      final userId = taskCompanion.creatorId.value;
      final taskId = await db.taskDaoDrift.addTask(taskCompanion);
      final taskUserLinkCompanion = TaskUserLinkTableDriftCompanion(
        taskId: Value(taskId),
        userId: Value(userId!),
      );
      await db.taskUserLinkDaoDrift.addTaskUser(taskUserLinkCompanion);
      return getTaskById(taskId);
    });
  }

  @override
  Future<TaskTableDriftG?> updateTask(TaskTableDriftCompanion taskCompanion) async {
    await db.taskDaoDrift.updateTask(taskCompanion);
    return getTaskById(taskCompanion.id.value);
  }

  @override
  Future<int> deleteTask(int taskId) {
    return db.taskDaoDrift.deleteTask(taskId);
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
  Future<List<TaskDTO>> getTaskDtoItemsFromUser(int userId) async {
    return await db.transaction(() async {
      final query = db.select(db.taskTableDrift).join([
        leftOuterJoin(
          db.taskUserLinkTableDrift,
          db.taskUserLinkTableDrift.taskId.equalsExp(db.taskTableDrift.id) &
              db.taskUserLinkTableDrift.userId.equals(userId),
        ),
      ]);
      final result = await query.get();
      if (result.isEmpty) {
        return [];
      } else {
        return dtoItemsFromQueryResult(result);
      }
    });
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
  Future<void> addUserItemsToTask(int taskId, List<int> userItems) async {
    await db.transaction(() async {
      for (final tagId in userItems) {
        await addUserItemToTask(taskId, tagId);
      }
    });
  }

  @override
  Future<int?> addUserItemToTask(int taskId, int tagId) async {
    return await db.taskUserLinkDaoDrift.addTaskUser(_createTaskUserCompanion(taskId, tagId));
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

  List<TaskDTO> dtoItemsFromQueryResult(List<TypedResult> items) {
    return items.map((row) {
      final taskRow = row.readTable(db.taskTableDrift);
      final taskUserLinkRow = row.readTableOrNull(db.taskUserLinkTableDrift);

      return TaskDTO(
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
        taskUserData: taskUserLinkRow != null
            ? TaskUserLinkEntity(
                id: taskUserLinkRow.id,
                linkingDate: taskUserLinkRow.linkingDate,
                taskId: taskUserLinkRow.taskId,
                userId: taskUserLinkRow.userId,
                selectedByUser: taskUserLinkRow.selectedByUser ?? false,
                orderedByUser: taskUserLinkRow.orderedByUser ?? double.maxFinite.toInt(),
              )
            : null,
      );
    }).toList();
  }
}
