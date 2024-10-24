import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class GetTaskItemsByIdSet extends UseCase<OrganizerItems<TaskEntity>, GetTaskItemsByIdSetParams> {
  final TaskRepository repository;

  GetTaskItemsByIdSet(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(GetTaskItemsByIdSetParams params) {
    return repository.getTaskItemsByIdSet(params.idSet);
  }
}

class GetTaskItemsByIdSetParams extends Equatable {
  final IdSet idSet;

  const GetTaskItemsByIdSetParams({required this.idSet});

  @override
  List<Object> get props => [idSet];
}
