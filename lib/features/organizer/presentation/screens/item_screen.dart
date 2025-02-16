import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/dynamic_bloc_resolver.dart';
import 'package:fo_fe/features/organizer/presentation/pages/item/item_dto_card.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';
import 'package:fo_fe/features/organizer/utils/other/screen_action_menu.dart';
import 'package:fo_fe/features/organizer/utils/other/update_item_logic.dart';

class ItemScreen<T extends DtoEntity> extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
        appBarTitle: TaskStrings().screenTitle,
        body: (userId) => _build(context, userId),
        menuOptions: (context, userId) => ScreenActionMenu.getMenuItems(context, T),
        onSearchSubmitted: (query) => _onSearchSubmitted(context, query));
  }

  void _onSearchSubmitted(BuildContext context, String query) {
    final bloc = DynamicBlocResolver.resolveBloc<T>(context);
    bloc.add(SearchItemsBlocEvent(query)); // Dispatch search event
  }

  Widget _build(BuildContext context, int userId) {
    final bloc = DynamicBlocResolver.resolveBloc<T>(context);
    bloc.add(GetItemsFromLogInUserBlocEvent(TaskParams(id: 0, forUserId: userId)));
    return BlocConsumer<OrganizerBloc<T>, OrganizerBlocState<T>>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == OrganizerBlocStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
          );
        }
      },
      builder: (context, state) {
        return buildBlocStateWidget(
          state: state,
          buildLoadedState: () => ItemListViewPage<T>(
            items: state.displayedItems,
            itemCardBuilder: (itemDto) => ItemDtoCard<T>(itemDto),
            value: (itemDto) => itemDto.isSelectedByUser,
            onChange: (context, itemDto, value) =>
                UpdateItemLogic.updateItemUserLink<T>(context, itemDto, value),
          ),
        );
      },
    );
  }
}
