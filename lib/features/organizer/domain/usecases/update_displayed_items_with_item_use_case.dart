import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../all_items/task/domain/repositories/task_repository.dart';

class UpdateDisplayedItemsWithItem<T extends ItemEntity, P extends ItemParams>
    extends UseCase<T, P> {
  final TaskRepository repository;

  UpdateDisplayedItemsWithItem(this.repository);

  @override
  Future<Either<Failure, T>> call(P params) {
    if (params is TaskParams) {
      return repository
          .updateTask(params.taskEntity)
          .then((result) => result as Either<Failure, T>);
    } else {
      return Future.value(Left(UnexpectedFailure("Invalid params")));
    }
  }
}
