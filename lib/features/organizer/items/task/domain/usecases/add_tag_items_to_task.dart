// file: usecases/add_tag_items_to_task.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';

import '../repositories/task_repository.dart';

class AddTagItemsToTask extends UseCase<OrganizerItems<TagEntity>, AddTagItemsToTaskParams> {
  final TaskRepository repository;

  AddTagItemsToTask(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(AddTagItemsToTaskParams params) {
    return repository.addTagItemsToTask(params.taskId, params.tagIds);
  }
}

class AddTagItemsToTaskParams extends Equatable {
  final int taskId;
  final IdSet tagIds;

  const AddTagItemsToTaskParams({
    required this.taskId,
    required this.tagIds,
  });

  @override
  List<Object> get props => [taskId, tagIds];
}
