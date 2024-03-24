import 'package:dartz/dartz.dart';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/core/util/elements/params.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

class FilterTaskList implements UseCase<TaskEntity, Params> {
  final TaskRepository taskRepository;

  FilterTaskList(this.taskRepository);

  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async {
    return await taskRepository.getTaskById(params.id);
  }
}
