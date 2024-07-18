import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/user_exports.dart';

abstract class TaskRepository {
  // Task CRUD operations
  Future<Either<Failure, int>> insertTask(TaskEntity task);

  Future<Either<Failure, bool>> updateTask(TaskEntity task);

  Future<Either<Failure, int>> deleteTask(int taskId);

  Future<Either<Failure, TaskEntity>> getTaskById(int id);

  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll();

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet);

  // User operations related to tasks
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUsersByTaskId(
      int taskId);

  Future<Either<Failure, UserEntity>> getCreatorById(int creatorId);

  Future<Either<Failure, int>> addUserToTask(int taskId, int userId);

  Future<Either<Failure, int>> deleteUserFromTask(int taskId, int userId);

  // Tag operations related to tasks
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagsByTaskId(
      int taskId);

  Future<Either<Failure, int>> addTagToTask(int taskId, int tagId);

  Future<Either<Failure, int>> deleteTagFromTask(int taskId, int tagId);

  // Reminder operations related to tasks
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getRemindersByTaskId(
      int taskId);

  Future<Either<Failure, int>> addReminderToTask(int taskId, int reminderId);

  Future<Either<Failure, int>> deleteReminderFromTask(
      int taskId, int reminderId);
}
