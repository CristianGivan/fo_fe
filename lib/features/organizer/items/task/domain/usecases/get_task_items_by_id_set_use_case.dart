import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class GetTaskItemsByIdSetUseCase extends UseCase<OrganizerItems<TaskEntity>, TaskParams> {
  final TaskRepository repository;

  GetTaskItemsByIdSetUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(TaskParams params) {
    return repository.getTaskItemsByIdSet(params.idSet);
  }
}

class GetTaskItemsByIdSetParams extends Equatable {
  final IdSet idSet;

  const GetTaskItemsByIdSetParams({required this.idSet});

  @override
  List<Object> get props => [idSet];
}
