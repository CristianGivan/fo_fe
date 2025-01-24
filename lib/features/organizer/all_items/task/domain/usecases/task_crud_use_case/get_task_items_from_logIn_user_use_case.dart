import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/entities/task_dto.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTaskItemsFromLogInUserUseCase extends UseCase<OrganizerItems<TaskDto>, ItemParams> {
  final TaskRepository repository;

  GetTaskItemsFromLogInUserUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskDto>>> call(params) async {
    return repository.getTaskItemsFromUser(params.forUserId);
  }
}
