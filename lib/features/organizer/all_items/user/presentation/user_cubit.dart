import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/domain/usecases/get_entities_from_user_use_case.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class UserCubit extends OrganizerCubit<UserEntity> {
  final GetEntitiesFromUserUseCase getEntitiesFromUserUseCase;

  UserCubit({
    required this.getEntitiesFromUserUseCase,
  });

  @override
  Future<void> getAllEntitiesFromUser(int userId) async {
    emit(OrganizerCubitState.loading());

    ItemParams itemParams = ItemParams(forUserId: userId, itemType: ItemsTypeEnum.user, id: 0);

    final result = await getEntitiesFromUserUseCase(itemParams);
    result.fold(
      (failure) => emit(OrganizerCubitState.error(failure.message ?? "Error")),
      (entities) => emit(OrganizerCubitState.loaded(entities as OrganizerItems<UserEntity>)),
    );
  }
}
