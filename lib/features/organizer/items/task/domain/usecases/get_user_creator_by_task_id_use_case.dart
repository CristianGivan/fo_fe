import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

import '../../../user/domain/entities/user_entity.dart';
import '../repositories/task_repository.dart';

class GetCreatorByTaskIdUseCase extends UseCase<UserEntity, TaskParams> {
  final TaskRepository repository;

  GetCreatorByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(TaskParams params) {
    return repository.getCreatorTaskById(params.id);
  }
}
