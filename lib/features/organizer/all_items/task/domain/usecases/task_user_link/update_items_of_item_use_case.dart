import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class UpdateItemsOfItemUseCase<T extends OrganizerItemEntity>
    extends UseCase<OrganizerItems<T>, ItemParams> {
  final TaskRepository repository;

  UpdateItemsOfItemUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemParams params) {
    if (params.itemType == ItemsTypeEnum.taskUser) {
      final userParams = params as UpdateItemsOfItemParams<T>;

      final result = repository.updateTaskUserItems(
        userParams.itemId,
        userParams.addedItems.getIdList(),
        userParams.removedItems.getIdList(),
      ) as Future<Either<Failure, OrganizerItems<T>>>;
      return result;
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
