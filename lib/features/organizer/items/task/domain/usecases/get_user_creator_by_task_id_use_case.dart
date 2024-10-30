import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../../../user/domain/entities/user_entity.dart';
import '../repositories/task_repository.dart';

class GetCreatorByTaskIdUseCase extends UseCase<UserEntity, GetByIdParams> {
  final TaskRepository repository;

  GetCreatorByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(GetByIdParams task) {
    return repository.getCreatorTaskById(task.id);
  }
}
