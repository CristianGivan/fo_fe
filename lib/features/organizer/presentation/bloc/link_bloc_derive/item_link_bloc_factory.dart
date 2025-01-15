import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_tag_link/get_tag_list_by_task_id_use_case.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:get_it/get_it.dart';

OrganizerLinkBloc<T> createItemLinkBloc<T extends ItemEntity>(ItemsTypeEnum itemType) {
  switch (itemType) {
    case ItemsTypeEnum.taskUser:
      return ItemUserLinkBloc(getItemsLinked: GetIt.instance.get()) as OrganizerLinkBloc<T>;
    case ItemsTypeEnum.taskTag:
      return _getTaskTagLinkBloc<T>();
    default:
      throw UnsupportedError('Unsupported itemType: $itemType');
  }
}

OrganizerLinkBloc<T> _getTaskTagLinkBloc<T extends ItemEntity>() {
  final GetTagEntitiesByTaskIdUseCase getTagItemsByTaskIdUseCase = GetIt.instance.get();
  return ItemTagLinkBloc(getTagItemsByTaskIdUseCase: getTagItemsByTaskIdUseCase)
      as OrganizerLinkBloc<T>;
}
