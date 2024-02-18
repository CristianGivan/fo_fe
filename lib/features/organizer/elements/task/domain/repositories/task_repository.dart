import 'package:dartz/dartz.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../core/error/failures.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> putTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> postTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> getTaskById(int id);

  Future<void> deleteTask(TaskEntity task);
}
