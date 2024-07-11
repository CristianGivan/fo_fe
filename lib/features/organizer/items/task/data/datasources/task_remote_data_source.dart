import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';

import '../../../../../../core/util/organizer/core_util_organizer.dart';
import '../models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<void> addTask(TaskEntity task);

  Future<void> addUserToTask(int taskId, int userId);

  Future<void> addTagToTask(int taskId, int tagId);

  Future<void> addReminderToTask(int taskId, ReminderEntity reminder);

  // Future<TaskModel> putTask(TaskModel task);
  //
  // Future<TaskModel> postTask(TaskModel task);

  Future<TaskModel> getTaskById(int id);

  Future<Map<String, dynamic>> getUpdatedTaskIfDifferent(
      Map<String, dynamic> json);

  // Future<void> deleteTask(int id);

  Future<OrganizerItems<TaskModel>> getUpdatedItems(
      OrganizerItems<TaskModel> items);
}
