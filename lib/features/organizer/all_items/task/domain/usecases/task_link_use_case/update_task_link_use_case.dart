import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/generic_handler_registry.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UpdateTaskLinkUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, UpdateLinkParams<T>> {
  final GenericHandlerRegistry registry;

  UpdateTaskLinkUseCase(this.registry);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(UpdateLinkParams<T> params) {
    final handler = registry.getUpdateHandler<T>();

    if (handler == null) {
      return Future.value(Left(UnexpectedFailure("No handler found for type ${T.runtimeType}")));
    }
    return handler.handle(params) as Future<Either<Failure, OrganizerItems<T>>>;
  }
}
