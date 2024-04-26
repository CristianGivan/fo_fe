import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/util/organizer/id_set.dart';
import 'package:fo_fe/core/util/organizer/organizer_items.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/organizer_item.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../../../../../../core/error/failures.dart';

abstract class TaskRepository<T extends OrganizerItemEntity>
    extends OrganizerItemRepository<T> {
  Future<Either<Failure, TaskEntity>> putTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> postTask(TaskEntity task);

  Future<Either<Failure, TaskEntity>> getTaskById(int id);

  // Future<Either<Failure, TaskEntity>> getTaskByIdSet(IdSet id);

  Future<Either<Failure, OrganizerItems<T>>> getTaskListByIdSet(IdSet id);

  Future<void> deleteTask(TaskEntity task);
}
