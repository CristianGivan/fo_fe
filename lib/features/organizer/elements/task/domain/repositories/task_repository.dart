import 'package:dartz/dartz.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

import '../../../../../../core/error/failures.dart';

abstract class TaskRepository {
  putTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> postTask(TaskEntity task);

  deleteTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> getTaskById(int id);
}
