import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/domain/entities/reminder_entity.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../../../../../../core/error/failures.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> getTaskById(int id);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsAll();

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskItemsByIdSet(
      IdSet idSet);

  Future<Either<Failure, void>> addTask(TaskEntity task);

  Future<Either<Failure, void>> addUserToTask(int taskId, int userId);

  Future<Either<Failure, void>> addTagToTask(int taskId, int tagId);

  Future<Either<Failure, void>> addReminderToTask(
      int taskId, ReminderEntity reminder);

  Future<Either<Failure, void>> deleteTask(int taskId);
}
