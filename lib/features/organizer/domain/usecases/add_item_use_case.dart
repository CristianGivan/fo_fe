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
      return _handleAddTask(params.taskEntity);
    } else {
      return Left(UnexpectedFailure("Invalid params"));
    }
  }

  Future<Either<Failure, T>> _handleAddTask(TaskEntity taskEntity) async {
    final failureOrTask = await repository.addTask(taskEntity);
    return failureOrTask.fold(
      (failure) => Left(failure),
      (task) => addTaskUserLinkAndReturnTaskDto(task),
    );
  }

  Future<Either<Failure, T>> addTaskUserLinkAndReturnTaskDto(TaskEntity task) async {
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
      (taskUserLink) => Right(TaskDto(task: task, taskUserLink: taskUserLink) as T),
    );
  }
}
