import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';

import '../repositories/task_repository.dart';

class GetTaskByIdUseCase extends UseCase<TaskEntity, TaskParams> {
  final TaskRepository repository;

  GetTaskByIdUseCase(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(TaskParams params) {
    return repository.getTaskById(params.id);
  }
}

class GetTaskByIdParams extends Equatable {
  final int id;

  const GetTaskByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
