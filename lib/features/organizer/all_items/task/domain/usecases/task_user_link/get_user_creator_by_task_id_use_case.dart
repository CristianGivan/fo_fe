import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';

import '../../repositories/task_repository.dart';

class GetCreatorByTaskIdUseCase extends UseCase<User, TaskParams> {
  final TaskRepository repository;

  GetCreatorByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(TaskParams params) {
    final userEntity = repository.getCreatorTaskById(params.id);
    // return User(userEntity);

    return Future.value(Left(UnexpectedFailure("Invalid params")));
  }
}
