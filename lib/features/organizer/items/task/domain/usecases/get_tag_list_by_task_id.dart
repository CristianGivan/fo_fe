import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/util/organizer/core_util_organizer.dart';
import 'package:fo_fe/features/organizer/items/tag/tag_exports.dart';

import '../repositories/task_repository.dart';

class GetTagsByTaskId
    extends UseCase<OrganizerItems<TagEntity>, GetTagsByTaskIdParams> {
  final TaskRepository repository;

  GetTagsByTaskId(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(
      GetTagsByTaskIdParams params) {
    return repository.getTagsByTaskId(params.taskId);
  }
}

class GetTagsByTaskIdParams extends Equatable {
  final int taskId;

  GetTagsByTaskIdParams({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
