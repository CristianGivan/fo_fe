import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/elements/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/elements/task/task_lib.dart';

class GetTaskById implements UseCase<TaskEntity, Params> {
  final TaskRepository taskRepository;

  GetTaskById(this.taskRepository);

  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async {
    return await taskRepository.getTaskById(params.id);
  }
}

class Params extends Equatable {
  final int id;
  Params({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
