import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/core/widgets/pages/item/item_card.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/widgets/task_screen_actions_menu.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/dynamic_bloc_resolver.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemScreen<T extends DtoEntity> extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContentScreen(
      appBarTitle: TaskStrings().screenTitle,
      body: (userId) => _build(context, userId),
      menuOptions: (context, userId) => TaskScreenActionsMenu.getMenuItems(context),
      onSearchSubmitted: () {},
    );
  }

  Widget _build(BuildContext context, int userId) {
    final OrganizerBloc<T> bloc = DynamicBlocResolver.resolveBloc<T>(context);
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
            itemsDto: state.displayedItems,
            itemCardBuilder: (itemDto) => ItemCard<T>(itemDto),
            value: _isSelected,
            onChange: (context, itemDto, value) => _updateTaskUserLink(context, itemDto, value),
          ),
        );
      },
    );
  }

  bool _isSelected(T itemDto) {
    return itemDto.userLink.isSelected;
  }

  void _updateTaskUserLink(BuildContext context, T itemDto, bool value) {
    final taskDto = itemDto as TaskDto;
    final updatedTaskUserLink = taskDto.taskUserLink.copyWith(isSelectedByUser: value);
    context.read<TaskBloc>().add(UpdateTaskBlocEvent(TaskParams(
          id: taskDto.id,
          taskDto: taskDto,
          taskUserLinkEntity: updatedTaskUserLink,
        )));
  }
}
