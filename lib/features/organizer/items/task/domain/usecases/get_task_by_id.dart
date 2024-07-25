import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

import '../repositories/task_repository.dart';

class GetTaskById extends UseCase<TaskEntity, GetTaskByIdParams> {
  final TaskRepository repository;

  GetTaskById(this.repository);

  @override
  Future<Either<Failure, TaskEntity>> call(GetTaskByIdParams params) {
    return repository.getTaskById(params.id);
  }
}

class GetTaskByIdParams extends Equatable {
  final int id;

  GetTaskByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
