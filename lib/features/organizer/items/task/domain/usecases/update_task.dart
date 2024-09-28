import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';

import '../repositories/task_repository.dart';

class UpdateTask extends UseCase<bool, UpdateTaskParams> {
  final TaskRepository repository;

  UpdateTask(this.repository);

  @override
  Future<Either<Failure, bool>> call(UpdateTaskParams params) {
    return repository.updateTask(params.task);
  }
}

class UpdateTaskParams extends Equatable {
  final TaskEntity task;

  const UpdateTaskParams({required this.task});

  @override
  List<Object> get props => [task];
}
