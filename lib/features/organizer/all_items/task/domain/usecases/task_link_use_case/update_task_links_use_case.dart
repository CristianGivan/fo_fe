import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/repositories/task_repository.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

typedef UpdateTaskLink<T extends ItemEntity> = Future<Either<Failure, OrganizerItems<T>>> Function(
    UpdateLinkParams<T> params);

class UpdateTaskLinkUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, UpdateLinkParams<T>> {
  final TaskRepository repository;

  UpdateTaskLinkUseCase(this.repository);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(UpdateLinkParams<T> params) {
    final updateTaskLink = _typeToTaskLink[T];
    if (updateTaskLink == null) {
      return Future.value(
          Left(UnImplementedFailure("UpdateTaskLinkUseCase: No implementation for type $T")));
    } else {
      return updateTaskLink(params) as Future<Either<Failure, OrganizerItems<T>>>;
    }
  }

  late final Map<Type, UpdateTaskLink> _typeToTaskLink = {
    UserEntity: (params) => repository.updateTaskUserItems(params as UpdateLinkParams<UserEntity>),
    TagEntity: (params) => repository.updateTaskTagItems(params as UpdateLinkParams<TagEntity>),
  };
}
