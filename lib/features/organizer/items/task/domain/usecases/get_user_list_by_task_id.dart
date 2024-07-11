import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../../../user/domain/entities/user_entity.dart';
import '../repositories/task_repository.dart';

class GetUsersByTaskId
    extends UseCase<List<UserEntity>, GetUsersByTaskIdParams> {
  final TaskRepository repository;

  GetUsersByTaskId(this.repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(
      GetUsersByTaskIdParams params) {
    return repository.getUsersByTaskId(params.taskId);
  }
}

class GetUsersByTaskIdParams extends Equatable {
  final int taskId;

  GetUsersByTaskIdParams({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
