import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef GetTaskLink = Future<Either<Failure, OrganizerItems<ItemEntity>>> Function(
    TaskRepository repository, ItemLinkParams params);

class GetTaskLinkUseCase<T extends ItemEntity> extends UseCase<OrganizerItems<T>, ItemLinkParams> {
  final TaskRepository repository;

  GetTaskLinkUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemLinkParams params) {
    final getTaskLink = typeToGetTaskLinkMap[T];

    if (getTaskLink == null) {
      return Future.value(Left(UnexpectedFailure("No handler found for type ${T.runtimeType}")));
    }
    return getTaskLink(repository, params) as Future<Either<Failure, OrganizerItems<T>>>;
  }

  final Map<Type, GetTaskLink> typeToGetTaskLinkMap = {
    UserEntity: getTaskUser,
    TagEntity: getTaskTag,
  };
}

Future<Either<Failure, OrganizerItems<UserEntity>>> getTaskUser(
    TaskRepository repository, ItemLinkParams params) {
  return repository.getUserItemsByTaskId(params.itemId);
}

Future<Either<Failure, OrganizerItems<TagEntity>>> getTaskTag(
    TaskRepository repository, ItemLinkParams params) {
  return repository.getTagItemsByTaskId(params.itemId);
}
