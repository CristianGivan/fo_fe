import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class DeleteUserFromTask extends UseCase<int, DeleteUserFromTaskParams> {
  final TaskRepository repository;

  DeleteUserFromTask(this.repository);

  @override
  Future<Either<Failure, int>> call(DeleteUserFromTaskParams params) {
    return repository.deleteUserFromTask(params.taskId, params.userId);
  }
}

class DeleteUserFromTaskParams extends Equatable {
  final int taskId;
  final int userId;

  DeleteUserFromTaskParams({required this.taskId, required this.userId});

  @override
  List<Object> get props => [taskId, userId];
}
