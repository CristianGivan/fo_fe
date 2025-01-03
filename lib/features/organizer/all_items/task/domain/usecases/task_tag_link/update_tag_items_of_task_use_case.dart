import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateTagItemsOfTaskUseCase
    extends UseCase<OrganizerItems<TagEntity>, UpdateItemsToTaskParams<TagEntity>> {
  final TaskRepository repository;

  UpdateTagItemsOfTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(UpdateItemsToTaskParams params) {
    List<int> addedTagItems = params.items.getAddedItems(params.updatedItems).getIdList();
    List<int> removedTagItems = params.items.getRemovedItems(params.updatedItems).getIdList();
    return repository.updateTaskTagItems(params.taskId, addedTagItems, removedTagItems);
  }
}
