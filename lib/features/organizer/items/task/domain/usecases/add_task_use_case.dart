import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

import '../repositories/task_repository.dart';

class AddTaskUseCase extends UseCase<TaskEntity, TaskParams> {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskParams params) async {
    final task = await repository.addTask(params.taskEntity);
    return task.fold(
      (failure) => Left(failure),
      (task) {
        repository.addTaskUserLink(TaskUserLinkEntity(
          id: 0,
          taskId: task.id,
          userId: task.creatorId,
          selectedByUser: false,
          orderedByUser: 0,
          linkingDate: DateTime.now(),
        ));
        return Right(task);
      },
    );
  }
}
