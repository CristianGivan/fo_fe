import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTaskItemsAllUseCase extends UseCase<OrganizerItems<TaskEntity>, NoParams> {
  final TaskRepository repository;

  GetTaskItemsAllUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(NoParams params) {
    return repository.getTaskItemsAll();
  }
}
