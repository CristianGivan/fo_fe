import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

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
