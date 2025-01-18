import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/get_link_items_by_item_id_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemUserLinkBloc extends OrganizerLinkBloc<UserEntity> {
  ItemUserLinkBloc({
    required GetLinkEntitiesByItemIdUseCase<UserEntity> getItemsLinked,
  }) : super(
          getItemsLinked: getItemsLinked,
        ) {
    setupEventHandlers();
  }

  @override
  OrganizerBlocState<User> get initialState =>
      ItemLinkUserBlocState(status: OrganizerBlocStatus.initial);
}
//base class and derived class
