import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../../user/utils/user_exports.dart';

class GetTaskItemsFromLogInUserUseCase extends UseCase<OrganizerItems<TaskDTO>, UserParams> {
  final TaskRepository repository;

  GetTaskItemsFromLogInUserUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskDTO>>> call(UserParams params) {
    return repository.getTaskDtoItemsFromUser(params.userId);
  }
}
