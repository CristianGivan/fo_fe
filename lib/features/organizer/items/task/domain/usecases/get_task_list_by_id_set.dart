import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/organizer_items.dart';
import 'package:fo_fe/core/util/organizer/params.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class GetTaskListByIdSet implements UseCase<OrganizerItems, Params> {
  final TaskRepository taskRepository;

  GetTaskListByIdSet(this.taskRepository);

  @override
  Future<Either<Failure, OrganizerItems>> call(Params params) async {
    return await taskRepository.getTaskListByIdSet(params.idSet);
  }
}
