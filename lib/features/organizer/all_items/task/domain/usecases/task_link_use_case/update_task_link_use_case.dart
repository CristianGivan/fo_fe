import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef GetTaskLink<T extends ItemEntity> = Future<Either<Failure, OrganizerItems<T>>> Function(
    TaskRepository repository, UpdateLinkParams<T> params);

class UpdateTaskLinkUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, UpdateLinkParams<T>> {
  final TaskRepository repository;

  UpdateTaskLinkUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(UpdateLinkParams<T> params) {
    final updateTaskLink = typeToGetTaskLinkMap[T] as GetTaskLink<T>?;

    if (updateTaskLink == null) {
      return Future.value(Left(UnexpectedFailure("No handler found for type ${T.runtimeType}")));
    }
    return updateTaskLink(repository, params);
  }
}

final Map<Type, GetTaskLink> typeToGetTaskLinkMap = {
  UserEntity: updateTaskUser as GetTaskLink<ItemEntity>,
  TagEntity: updateTaskTag as GetTaskLink<ItemEntity>,
};

Future<Either<Failure, OrganizerItems<UserEntity>>> updateTaskUser<ItemEntity>(
    TaskRepository repository, UpdateLinkParams<UserEntity> params) {
  return repository.updateTaskUserItems(
    params.itemId,
    params.addedItems.getIdList(),
    params.removedItems.getIdList(),
  );
}

Future<Either<Failure, OrganizerItems<TagEntity>>> updateTaskTag(
    TaskRepository repository, UpdateLinkParams<TagEntity> params) {
  return repository.updateTaskTagItems(
    params.itemId,
    params.addedItems.getIdList(),
    params.removedItems.getIdList(),
  );
}
