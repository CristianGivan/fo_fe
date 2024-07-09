import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class GetTaskById implements UseCase<TaskEntity, Params> {
  final TaskRepository taskRepository;

  GetTaskById(this.taskRepository);

  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async {
    return taskRepository.getTaskById(params.id);
  }
}
