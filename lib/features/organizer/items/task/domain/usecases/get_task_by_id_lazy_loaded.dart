import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';

import '../entities/task_entity_lazy_loaded.dart';
import '../repositories/task_repository.dart';

class GetTaskByIdLazyLoaded
    extends UseCase<TaskEntityLazyLoaded, GetTaskByIdLazyLoadedParams> {
  final TaskRepository repository;

  GetTaskByIdLazyLoaded(this.repository);

  @override
  Future<Either<Failure, TaskEntityLazyLoaded>> call(
      GetTaskByIdLazyLoadedParams params) {
    return repository.getTaskByIdLazyLoaded(params.id);
  }
}

class GetTaskByIdLazyLoadedParams extends Equatable {
  final int id;

  const GetTaskByIdLazyLoadedParams({required this.id});

  @override
  List<Object> get props => [id];
}
