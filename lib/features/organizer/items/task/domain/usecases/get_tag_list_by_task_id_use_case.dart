import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class GetTagItemsByTaskIdUseCase extends UseCase<OrganizerItems<TagEntity>, GetTagsByTaskIdParams> {
  final TaskRepository repository;

  GetTagItemsByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(GetTagsByTaskIdParams params) {
    return repository.getTagItemsByTaskId(params.taskId);
  }
}

class GetTagsByTaskIdParams extends Equatable {
  final int taskId;

  const GetTagsByTaskIdParams({required this.taskId});

  @override
  List<Object> get props => [taskId];
}
