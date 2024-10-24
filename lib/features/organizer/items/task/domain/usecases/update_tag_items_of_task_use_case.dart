// file: usecases/add_tag_items_to_task.dart
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class UpdateTagItemsOfTask extends UseCase<OrganizerItems<TagEntity>, UpdateTagItemsToTaskParams> {
  final TaskRepository repository;

  UpdateTagItemsOfTask(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(UpdateTagItemsToTaskParams params) {
    List<int> addedTagItems = params.tagItems.getAddedItems(params.updatedTagItems).getIdList();
    List<int> removedTagItems = params.tagItems.getRemovedItems(params.updatedTagItems).getIdList();

    return repository.updateTagItemOfTask(params.taskId, addedTagItems, removedTagItems);
  }
}

class UpdateTagItemsToTaskParams extends Equatable {
  final int taskId;
  final OrganizerItems<TagEntity> tagItems;
  final OrganizerItems<TagEntity> updatedTagItems;

  const UpdateTagItemsToTaskParams({
    required this.taskId,
    required this.tagItems,
    required this.updatedTagItems,
  });

  @override
  List<Object> get props => [taskId, tagItems, updatedTagItems];
}
