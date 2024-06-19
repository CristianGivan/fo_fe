import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../../../../../../core/error/failures.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> putTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> postTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> getTaskById(int id);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskListByIdSet(
      IdSet id);

  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskListAll();

  Future<void> deleteTask(TaskEntity task);
}
