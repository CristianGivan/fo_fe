import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';

import '../../../user/domain/entities/user_entity.dart';
import '../repositories/task_repository.dart';

class GetUsersByTaskId
    extends UseCase<OrganizerItems<UserEntity>, GetUsersByTaskIdParams> {
  final TaskRepository repository;

  GetUsersByTaskId(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(
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
