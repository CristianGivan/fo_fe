import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

class PostTask implements UseCase<TaskEntity, TaskEntity> {
  TaskRepository taskRepository;
  PostTask(
    this.taskRepository,
  );

  @override
  Future<Either<Failure, TaskEntity>> call(TaskEntity taskEntity) async {
    return await taskRepository.postTask(taskEntity);
  }
}
