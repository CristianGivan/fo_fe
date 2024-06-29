import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/items/task/task_lib.dart';

class LoadTaskItemsAll
    implements UseCase<OrganizerItems<TaskEntity>, NoParams> {
  final TaskRepository taskRepository;

  LoadTaskItemsAll(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(
      NoParams params) async {
    return await taskRepository.getTaskItemsAll();
  }
}
