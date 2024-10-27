import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TaskRepository {
  // Task CRUD operations
  Future<Either<Failure, int>> addTask(TaskEntity task);

  Future<Either<Failure, bool>> updateTask(TaskEntity task);

  Future<Either<Failure, int>> deleteTask(int taskId);

  Future<Either<Failure, TaskEntity>> getTaskById(int id);

  Future<Either<Failure, TaskEntityLazyLoaded>> getTaskByIdLazyLoaded(int id);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll();

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet);

  // User operations related to tasks
  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTaskId(
      int taskId);

  Future<Either<Failure, UserEntity>> getCreatorById(int creatorId);

  Future<Either<Failure, int>> addUserToTask(int taskId, int userId);

  Future<Either<Failure, int>> deleteUserFromTask(int taskId, int userId);

  // Tag operations related to tasks
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByTaskId(
      int taskId);

  Future<Either<Failure, int>> addTagToTask(int taskId, int tagId);

  Future<Either<Failure, OrganizerItems<TagEntity>>> addTagItemsToTask(
      int taskId, IdSet tagIds);

  Future<Either<Failure, int>> deleteTagFromTask(int taskId, int tagId);

  Future<Either<Failure, OrganizerItems<TagEntity>>> updateTagItemOfTask(
      int taskId, List<int> tagItems, List<int> updatedTagItems);

  // Reminder operations related to tasks
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getRemindersByTaskId(
      int taskId);

  Future<Either<Failure, int>> addReminderToTask(int taskId, int reminderId);

  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      addReminderItemsToTask(int taskId, IdSet tagIds);

  Future<Either<Failure, int>> deleteReminderFromTask(
      int taskId, int reminderId);

  Future<Either<Failure, OrganizerItems<ReminderEntity>>>
      updateReminderItemOfTask(
          int taskId, List<int> reminderItems, List<int> updatedReminderItems);
}
