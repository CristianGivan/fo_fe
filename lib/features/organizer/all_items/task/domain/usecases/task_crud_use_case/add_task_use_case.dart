import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/item_type/item_add_params.dart';

import '../../repositories/task_repository.dart';

// todo -decide-
//v1 to have a generic use case that will have  depending on the type be writen in different class

class AddTaskUseCase extends UseCase<TaskDto, AddItemParams> {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  @override
  Future<Either<Failure, TaskDto>> call(AddItemParams params) async {
    return _handleAddTask(params.item as TaskEntity);
  }

  Future<Either<Failure, TaskDto>> _handleAddTask(TaskEntity taskEntity) async {
    final failureOrTask = await repository.addTask(taskEntity);
    return failureOrTask.fold(
      (failure) => Left(failure),
      (task) => addTaskUserLinkAndReturnTaskDto(task),
    );
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
