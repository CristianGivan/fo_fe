import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

import '../../repositories/task_repository.dart';

class GetTagEntitiesByTaskIdUseCase extends UseCase<OrganizerItems<TagEntity>, ItemsLinkParams> {
  final TaskRepository repository;

  GetTagEntitiesByTaskIdUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(ItemsLinkParams params) {
    return repository.getTagItemsByTaskId(params.id);
  }
}
