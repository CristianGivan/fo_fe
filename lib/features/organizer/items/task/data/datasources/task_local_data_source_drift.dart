import 'package:fo_fe/core/db/drift/organizer_drift_exports.dart';

import '../../../../../../core/util/organizer/core_util_organizer.dart';
import '../models/task_model.dart';
import 'task_local_data_source.dart';

class TaskLocalDataSourceDrift implements TaskLocalDataSource {
  final TaskDaoDrift taskDao;
  final UserDaoDrift userDao;
  final TagDaoDrift tagDao;
  final ReminderDaoDrift reminderDao;

  TaskLocalDataSourceDrift({
    required this.taskDao,
    required this.userDao,
    required this.tagDao,
    required this.reminderDao,
  });

  @override
  Future<List<TaskModel>> getTasksByIdSet(IdSet idSet) async {
    final tasks = await taskDao.getTasksByIdSet(idSet.ids.toList());
    return tasks.map((task) => TaskModel.fromData(task)).toList();
  }

  @override
  Future<void> addTask(TaskModel task) async {
    await taskDao.insertTask(task.toData());
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    final tasks = await taskDao.getAllTasks();
    return tasks.map((task) => TaskModel.fromData(task)).toList();
  }

  @override
  Future<void> addUserToTask(int taskId, int userId) async {
    await taskDao.addUserToTask(taskId, userId);
  }

  @override
  Future<void> addTagToTask(int taskId, int tagId) async {
    await taskDao.addTagToTask(taskId, tagId);
  }

  @override
  Future<void> addReminderToTask(int taskId, ReminderModel reminder) async {
    await reminderDao.insertReminder(reminder.toData(taskId));
  }
}
