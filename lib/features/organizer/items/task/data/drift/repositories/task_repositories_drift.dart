import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/data/drift/models/task_model_drift.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

import '../datasourece/task_dao_drift.dart';

class TaskRepositoriesDrift implements TaskRepository {
  final TaskDaoDrift taskDao;

  TaskRepositoriesDrift(this.taskDao);

  @override
  Future<void> deleteTask(TaskEntity task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> getTaskById(int id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskListAll() async {
    Either<Failure, OrganizerItems<TaskEntity>> result;
    final tasks = (await taskDao.getAllTasks());
    final List<TaskEntity> taskEntities = await Future.wait(
        tasks.map((e) async => TaskModelDrift.toTaskEntityE(e)));
    result = Right(OrganizerItems.of(taskEntities));

    return result;
  }

  @override
  Future<Either<Failure, TaskEntity>> postTask(TaskEntity task) {
    // TODO: implement postTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntity>> putTask(TaskEntity task) {
    // TODO: implement putTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> getTaskListByIdSet(
      IdSet id) {
    // TODO: implement getTaskListByIdSet
    throw UnimplementedError();
  }
}
