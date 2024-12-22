import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

import '../repositories/task_repository.dart';

class UpdateTaskDtoUseCase extends UseCase<TaskDto, TaskParams> {
  final TaskRepository repository;

  UpdateTaskDtoUseCase(this.repository);

//todo -refactor- find a better way
  @override
  Future<Either<Failure, TaskDto>> call(TaskParams params) async {
    if (params.taskDto.task.isEmpty) {
      return Future.value(Left(TaskFailure("Task is empty")));
    } else {
      TaskDto result = params.taskDto;
      if (!params.taskEntity.isEmpty) {
        final updateTaskRepo = await repository.updateTask(params.taskEntity);
        if (updateTaskRepo.isLeft()) {
          return Future.value(Left(TaskFailure("Unexpected error")));
        } else {
          final updatedTask = updateTaskRepo.getOrElse(() => TaskEntity.empty());
          result = params.taskDto.copyWith(task: updatedTask);
        }
      }
      if (!params.taskUserLinkEntity.isEmpty) {
        final updateTaskUserLinkRepo =
            await repository.updateTaskUserLink(params.taskUserLinkEntity);
        if (updateTaskUserLinkRepo.isLeft()) {
          return Future.value(Left(TaskFailure("Unexpected error")));
        } else {
          final updatedTaskUserLink =
              updateTaskUserLinkRepo.getOrElse(() => TaskUserLinkEntity.empty());
          result = result.copyWith(taskUserLink: updatedTaskUserLink);
        }
      }
      return Right(result);
    }
  }
}
