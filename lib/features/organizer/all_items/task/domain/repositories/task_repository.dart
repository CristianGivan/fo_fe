import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/features/organizer/all_items/reminder/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class TaskRepository {
  // Task CRUD operations
  Future<Either<Failure, TaskEntity>> addTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity task);

  Future<Either<Failure, int>> deleteTask(int taskId);

  Future<Either<Failure, IdSet>> deleteTaskItems(IdSet idSet);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskEntitiesFromUser(int userId);

  Future<Either<Failure, OrganizerItems<TaskDto>>> getTaskItemsFromUser(int userId);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(IdSet idSet);

  // User operations related to tasks

  Future<Either<Failure, TaskUserLinkEntity>> addTaskUserLink(TaskUserLinkEntity taskUserEntity);

  Future<Either<Failure, OrganizerItems<UserEntity>>> getUserItemsByTaskId(int taskId);

  Future<Either<Failure, UserEntity>> getCreatorTaskById(int taskId);

  Future<Either<Failure, TaskUserLinkEntity>> updateTaskUserLink(TaskUserLinkEntity task);

  Future<Either<Failure, OrganizerItems<UserEntity>>> updateTaskUserItems(
      UpdateLinkParams<UserEntity> params);

  // Tag operations related to tasks
  Future<Either<Failure, OrganizerItems<TagEntity>>> getTagItemsByTaskId(int taskId);

  Future<Either<Failure, OrganizerItems<TagEntity>>> updateTaskTagItems(
      UpdateLinkParams<TagEntity> params);

  // Reminder operations related to tasks
  Future<Either<Failure, OrganizerItems<ReminderEntity>>> getRemindersByTaskId(int taskId);

  Future<Either<Failure, OrganizerItems<ReminderEntity>>> updateTaskReminderItems(
      int taskId, List<int> addedReminderItems, List<int> removedReminderItems);
}
