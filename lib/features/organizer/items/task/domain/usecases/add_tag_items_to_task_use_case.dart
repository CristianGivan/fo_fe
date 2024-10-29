import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../repositories/task_repository.dart';

class AddTagItemsToTaskUseCase extends UseCase<OrganizerItems<TagEntity>, AddItemsToTaskParams> {
  final TaskRepository repository;

  AddTagItemsToTaskUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(AddItemsToTaskParams params) {
    return repository.addTagItemsToTask(params.taskId, params.itemsIds);
  }
}
