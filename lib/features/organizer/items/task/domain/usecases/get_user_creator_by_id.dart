import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../../../user/domain/entities/user_entity.dart';
import '../repositories/task_repository.dart';

class GetCreatorById extends UseCase<UserEntity, GetCreatorByIdParams> {
  final TaskRepository repository;

  GetCreatorById(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(GetCreatorByIdParams params) {
    return repository.getCreatorById(params.creatorId);
  }
}

class GetCreatorByIdParams extends Equatable {
  final int creatorId;

  const GetCreatorByIdParams({required this.creatorId});

  @override
  List<Object> get props => [creatorId];
}
