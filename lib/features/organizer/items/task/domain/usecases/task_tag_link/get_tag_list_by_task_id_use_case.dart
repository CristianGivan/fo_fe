import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class GetTagItemsByTaskIdUseCase extends UseCase<OrganizerItems<TagEntity>, TaskParams> {
  final TaskRepository repository;

  GetTagItemsByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(TaskParams params) {
    return repository.getTagItemsByTaskId(params.id);
  }
}
