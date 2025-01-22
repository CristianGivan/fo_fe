import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_link_use_case/generic_handler_registry.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetTaskLinkUseCase<T extends ItemEntity> extends UseCase<OrganizerItems<T>, ItemLinkParams> {
  final GenericHandlerRegistry handlerRegistry;

  GetTaskLinkUseCase(this.handlerRegistry);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemLinkParams params) {
    final handler = handlerRegistry.getGetHandler<T>();

    if (handler == null) {
      return Future.value(Left(UnexpectedFailure("No handler found for type ${T.runtimeType}")));
    }

    return handler.handle(params) as Future<Either<Failure, OrganizerItems<T>>>;
  }
}
