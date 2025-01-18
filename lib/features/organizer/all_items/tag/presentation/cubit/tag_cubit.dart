import 'package:fo_fe/features/organizer/all_items/tag/domain/entities/tag_entity.dart';
import 'package:fo_fe/features/organizer/domain/usecases/get_entities_from_user_use_case.dart';
import 'package:fo_fe/features/organizer/presentation/cubit/organizer_cubit.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagCubit extends OrganizerCubit<TagEntity> {
  final GetEntitiesFromUserUseCase getEntitiesFromUserUseCase;

  TagCubit({
    required this.getEntitiesFromUserUseCase,
  });

  @override
  Future<void> getEntitiesFromUser(int userId) async {
    emit(OrganizerCubitState.loading());

    ItemParams itemParams = ItemParams(forUserId: userId, itemType: ItemsTypeEnum.tag, id: 0);

    final result = await getEntitiesFromUserUseCase(itemParams);
    result.fold(
      (failure) => emit(OrganizerCubitState.error(failure.message ?? "Error")),
      (entities) => emit(OrganizerCubitState.loaded(entities as OrganizerItems<TagEntity>)),
    );
  }
}
