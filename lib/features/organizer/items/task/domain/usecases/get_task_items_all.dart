import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/no_params.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/organizer_item/config/organizer_item_export.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/items/task/domain/repositories/task_repository.dart';

class GetTaskItemsAll extends UseCase<OrganizerItems<TaskEntity>, NoParams> {
  final TaskRepository repository;

  GetTaskItemsAll(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TaskEntity>>> call(NoParams params) {
    return repository.getTaskItemsAll();
  }
}
