import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';

class UpdateTaskUserLinkUseCase extends UseCase<TaskUserLinkEntity, TaskUserLinkEntity> {
  final TaskRepository repository;

  UpdateTaskUserLinkUseCase(this.repository);

  @override
  Future<Either<Failure, TaskUserLinkEntity>> call(TaskUserLinkEntity taskUserLinkEntity) {
    return repository.updateTaskUserLink(taskUserLinkEntity);
  }
}
