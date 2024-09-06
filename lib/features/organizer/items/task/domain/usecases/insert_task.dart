import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/task/config/task_exports.dart';

import '../repositories/task_repository.dart';

class InsertTask extends UseCase<int, InsertTaskParams> {
  final TaskRepository repository;

  InsertTask(this.repository);

  @override
  Future<Either<Failure, int>> call(InsertTaskParams params) {
    return repository.insertTask(params.task);
  }
}

class InsertTaskParams extends Equatable {
  final TaskEntity task;

  const InsertTaskParams({required this.task});

  @override
  List<Object> get props => [task];
}
