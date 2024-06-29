import '../../../../../../core/util/organizer/core_util_organizer.dart';
import '../../../organizer_item/domain/entities/reminder_entity.dart';
import '../../task_lib.dart';

abstract class TaskLocalDataSource {
  Future<OrganizerItems<TaskEntity>> getTasksByIdSet(IdSet idSet);

  Future<void> addTask(TaskEntity task);

  Future<OrganizerItems<TaskEntity>> getAllTasks();

  Future<void> addUserToTask(int taskId, int userId);

  Future<void> addTagToTask(int taskId, int tagId);

  Future<void> addReminderToTask(int taskId, ReminderEntity reminder);
}
