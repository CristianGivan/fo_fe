import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateTagItemsOfTaskUseCase
    extends UseCase<OrganizerItems<Tag>, UpdateItemsOfItemParams<Tag>> {
  final TaskRepository repository;

  UpdateTagItemsOfTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<Tag>>> call(UpdateItemsOfItemParams params) {
    // List<int> addedTagItems = params.items.getAddedItems(params.updatedItems).getIdList();
    // List<int> removedTagItems = params.items.getRemovedItems(params.updatedItems).getIdList();
    // return repository.updateTaskTagItems(params.itemId, addedTagItems, removedTagItems);
    return Future.value(Left(UnexpectedFailure("Invalid params")));
  }
}
