import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

class UpdateTaskUserLinkUseCase extends UseCase<TaskUserLinkEntity, TaskParams> {
  final TaskRepository repository;

  UpdateTaskUserLinkUseCase(this.repository);

  @override
  Future<Either<Failure, TaskUserLinkEntity>> call(TaskParams params) async {
    return repository.updateTaskUserLink(params.taskUserLinkEntity);
  }
}
