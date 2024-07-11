import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class DeleteTask extends UseCase<int, DeleteTaskParams> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteTaskParams params) {
    return repository.deleteTask(params.taskId);
  }
}

class DeleteTaskParams extends Equatable {
  final int taskId;

  DeleteTaskParams({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
