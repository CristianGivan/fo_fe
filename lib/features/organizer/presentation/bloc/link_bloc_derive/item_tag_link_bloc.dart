import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_tag_link/get_tag_list_by_task_id_use_case.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemTagLinkBloc extends OrganizerLinkBloc<TagEntity> {
  ItemTagLinkBloc({
    required GetTagEntitiesByTaskIdUseCase getTagItemsByTaskIdUseCase,
  }) : super(
          getItemsLinked: getTagItemsByTaskIdUseCase,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<Tag> get initialState =>
      ItemLinkTagBlocState(status: OrganizerBlocStatus.initial);
}
