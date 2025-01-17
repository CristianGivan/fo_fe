import 'package:fo_fe/core/utils/exports/external_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/domain/usecases/get_entities_from_user_use_case.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserCubit extends Cubit<OrganizerState<UserEntity>> {
  final GetEntitiesFromUserUseCase getEntitiesFromUserUseCase;
  final UpdateItemUseCase updateUserItemsUseCase;

  UserCubit({
    required this.getEntitiesFromUserUseCase,
    required this.updateUserItemsUseCase,
  }) : super(OrganizerState.initial());

  Future<void> getEntitiesFromUser(int userId) async {
    emit(OrganizerState.loading());

    ItemParams itemParams = ItemParams(forUserId: userId, itemType: ItemsTypeEnum.user, id: 0);

    final result = await getEntitiesFromUserUseCase(itemParams);
    result.fold(
      (failure) => emit(OrganizerState.error(failure.message ?? "Error")),
      (entities) => emit(OrganizerState.loaded(entities as OrganizerItems<UserEntity>)),
    );
  }

  Future<void> updateEntities(List<UserEntity> entities) async {
    emit(OrganizerState.loading());

    // final result = await updateUserItemsUseCase(entities);
    // result.fold(
    //   (failure) => emit(OrganizerState.error(failure.message)),
    //   (_) => emit(OrganizerState.loaded(OrganizerItems<UserEntity>(items: entities))),
    // );
        emit(OrganizerState.error("Not implemented"));
  }
}
