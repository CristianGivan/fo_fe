import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateTaskDtoUseCase extends UseCase<TaskDto, TaskParams> {
  final TaskRepository repository;

  UpdateTaskDtoUseCase(this.repository);

  @override
  Future<Either<Failure, TaskDto>> call(TaskParams params) async {
    if (params.taskDto.task.isEmpty) {
      return Future.value(Left(TaskFailure("Task is empty")));
    }

    TaskDto result = params.taskDto;

    final updateResults = await Future.wait([
      if (!params.taskEntity.isEmpty) _updateTaskEntity(params.taskEntity),
      if (!params.taskUserLinkEntity.isEmpty) _updateTaskUserLinkEntity(params.taskUserLinkEntity),
    ]);

    for (var updateResult in updateResults) {
      if (updateResult.isLeft()) {
        return Left(TaskFailure("Unexpected error during update"));
      }
    }

    updateResults.forEach((updateResult) {
      updateResult.fold(
        (failure) {},
        (updatedEntity) {
          if (updatedEntity is TaskEntity) {
            result = result.copyWith(task: updatedEntity);
          } else if (updatedEntity is TaskUserLinkEntity) {
            result = result.copyWith(taskUserLink: updatedEntity);
          }
        },
      );
    });

    return Right(result);
  }

  Future<Either<Failure, TaskEntity>> _updateTaskEntity(TaskEntity taskEntity) async {
    final updateTaskRepo = await repository.updateTask(taskEntity);
    return updateTaskRepo.map((updatedTask) => updatedTask);
  }

  Future<Either<Failure, TaskUserLinkEntity>> _updateTaskUserLinkEntity(
      TaskUserLinkEntity taskUserLinkEntity) async {
    final updateTaskUserLinkRepo = await repository.updateTaskUserLink(taskUserLinkEntity);
    return updateTaskUserLinkRepo.map((updatedTaskUserLink) => updatedTaskUserLink);
  }
}
