import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../repositories/task_repository.dart';

class AddUserToTask extends UseCase<int, AddUserToTaskParams> {
  final TaskRepository repository;

  AddUserToTask(this.repository);

  @override
  Future<Either<Failure, int>> call(AddUserToTaskParams params) {
    return repository.addUserToTask(params.taskId, params.userId);
  }
}

class AddUserToTaskParams extends Equatable {
  final int taskId;
  final int userId;

  AddUserToTaskParams({required this.taskId, required this.userId});

  @override
  List<Object> get props => [taskId, userId];
}
