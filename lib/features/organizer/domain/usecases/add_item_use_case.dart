import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../all_items/task/domain/repositories/task_repository.dart';

class AddItemUseCase<T extends ItemEntity, P extends ItemParams> extends UseCase<T, P> {
  final TaskRepository repository;

  AddItemUseCase(this.repository);

  @override
  Future<Either<Failure, T>> call(P params) async {
    if (params is TaskParams) {
      final failureOrTask = await repository.addTask(params.taskEntity);
      return failureOrTask.fold(
        (failure) => Left(failure),
        (task) => addTaskUserLinkAndReturnTaskDto(task) as Either<Failure, T>,
      );
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }

  Future<Either<Failure, TaskDto>> addTaskUserLinkAndReturnTaskDto(TaskEntity task) async {
    final failureOrTaskUserLink = await repository.addTaskUserLink(TaskUserLinkEntity(
      id: 0,
      taskId: task.id,
      userId: task.creatorId,
      selectedByUser: false,
      orderedByUser: 0,
      linkingDate: DateTime.now(),
    ));
    return failureOrTaskUserLink.fold(
      (failure) => Left(failure),
      (taskUserLink) => Right(TaskDto(task: task, taskUserLink: taskUserLink)),
    );
  }
}
