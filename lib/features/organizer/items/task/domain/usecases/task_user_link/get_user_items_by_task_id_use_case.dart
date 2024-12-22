import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../../user/domain/entities/user_entity.dart';
import '../../repositories/task_repository.dart';

class GetUserItemsByTaskIdUseCase extends UseCase<OrganizerItems<UserEntity>, TaskParams> {
  final TaskRepository repository;

  GetUserItemsByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(TaskParams params) {
    return repository.getUserItemsByTaskId(params.id);
  }
}
