import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../all_items/task/domain/repositories/task_repository.dart';

class DeleteItemsUseCase<T extends DtoEntity> extends UseCase<IdSet, IdSet> {
  final TaskRepository repository;
  final ItemsTypeEnum itemsType;

  DeleteItemsUseCase(this.repository, this.itemsType);

  @override
  Future<Either<Failure, IdSet>> call(IdSet idSet) {
    if (itemsType == ItemsTypeEnum.task) {
      return repository.deleteTaskItems(idSet);
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
