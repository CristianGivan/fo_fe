import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/params.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class GetTaskListByIdSet implements UseCase<TaskEntity, Params> {
  final TaskRepository taskRepository;

  GetTaskListByIdSet(this.taskRepository);

  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async {
    return await taskRepository.getTaskByIdSet(params.idSet);
  }
}
