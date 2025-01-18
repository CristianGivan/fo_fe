import 'package:dartz/dartz.dart';
import 'package:fo_fe/core/error/failures.dart';
import 'package:fo_fe/core/usecase/usecase.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/get_linked_items/ItemTypeHandler.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class GetLinkEntitiesByItemIdUseCase<T extends ItemEntity>
    extends UseCase<OrganizerItems<T>, ItemsLinkParams> {
  final ItemTypeHandlerRegistry handlerRegistry;

  GetLinkEntitiesByItemIdUseCase(this.handlerRegistry);

  @override
  Future<Either<Failure, OrganizerItems<T>>> call(ItemsLinkParams params) async {
    final handler = handlerRegistry.getHandler(params.itemType);

    if (handler == null) {
      return Left(UnexpectedFailure("No handler found for ${params.itemType}"));
    }

    return await handler.handle(params.id) as Future<Either<Failure, OrganizerItems<T>>>;
  }
}
