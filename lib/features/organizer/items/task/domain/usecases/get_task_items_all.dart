import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_exports.dart';

class GetTaskItemsAll extends UseCase<OrganizerItems<TaskEntity>, NoParams> {
  final TaskRepository repository;

  GetTaskItemsAll(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(NoParams params) {
    return repository.getTaskItemsAll();
  }
}
