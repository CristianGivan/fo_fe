import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/domain/usecases/task_user_link/update_items_of_item_use_case.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/all_items/user/utils/user_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

part 'item_link_items_bloc_event.dart';
part 'item_link_items_bloc_state.dart';

class ItemLinkItemsBloc<T extends OrganizerItemEntity> extends OrganizerLinkBloc {
  final GetLinkItemsByItemIdUseCase getUserItemsByTaskIdUseCase;
  final UpdateItemsOfItemUseCase<T> updateLinkItemsOfItemUseCase;

  ItemLinkItemsBloc({
    required this.getUserItemsByTaskIdUseCase,
    required this.updateLinkItemsOfItemUseCase,
  }) : super(
          getItemsLinked: getUserItemsByTaskIdUseCase,
        ) {
    setupEventHandlers();
    on<UpdateItemsOfItemBlocEvent>(_onUpdateLinkItemsOfItem);
  }

  Future<void> _onUpdateLinkItemsOfItem(
      UpdateItemsOfItemBlocEvent event, Emitter<OrganizerBlocState> emit) async {
    await handleEvent(
      event: event,
      emit: emit,
      action: () => updateLinkItemsOfItemUseCase(event.params),
      originalItems: (items) => items,
      displayedItems: (items) => items,
    );
  }
}
