import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

abstract class UpdateTaskLinkUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, UpdateLinkParams<T>> {
  final TaskRepository repository;

  UpdateTaskLinkUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(UpdateLinkParams<T> params);
}

class UpdateUserTaskLinkUseCase extends UpdateTaskLinkUseCase<UserEntity> {
  UpdateUserTaskLinkUseCase(TaskRepository repository) : super(repository);

  @override
  Future<Either<Failure, OrganizerItems<UserEntity>>> call(UpdateLinkParams<UserEntity> params) {
    return repository.updateTaskUserItems(
      params.itemId,
      params.addedItems.getIdList(),
      params.removedItems.getIdList(),
    );
  }
}

class UpdateTagTaskLinkUseCase extends UpdateTaskLinkUseCase<TagEntity> {
  UpdateTagTaskLinkUseCase(TaskRepository repository) : super(repository);

  @override
  Future<Either<Failure, OrganizerItems<TagEntity>>> call(UpdateLinkParams<TagEntity> params) {
    return repository.updateTaskTagItems(
      params.itemId,
      params.addedItems.getIdList(),
      params.removedItems.getIdList(),
    );
  }
}
