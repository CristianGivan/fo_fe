import 'package:fo_fe/core/widgets/pages/link_item_list_view_page.dart';
import 'package:fo_fe/features/organizer/all_items/task/presentation/logic/task_bloc/task_items_link/item_link_items_bloc.dart';
import 'package:fo_fe/features/organizer/all_items/task/utils/task_exports.dart';
import 'package:fo_fe/features/organizer/presentation/bloc/organizer_link_bloc_event.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ItemLinkItemsPage<T extends OrganizerItemEntity> extends StatelessWidget {
  final ItemParams params;

  const ItemLinkItemsPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final itemLinkItemsBloc = context.read<ItemLinkItemsBloc<T>>();
    if (itemLinkItemsBloc.state.status != OrganizerBlocStatus.loaded) {
      itemLinkItemsBloc.add(GetItemsOfItemBlocEvent(params));
    }
    return BlocBuilder<ItemLinkItemsBloc<T>, OrganizerBlocState>(builder: (context, state) {
      return buildStateWidget(
        state: state,
        buildErrorState: _buildErrorState,
        buildLoadingState: _buildLoadingState,
        buildLoadedState: () =>
            _buildItemsListPage(context, state.displayedItems as OrganizerItems<T>),
      );
    });
  }

  Widget _buildErrorState(String? message) =>
      Center(child: Text(message ?? "Unknown error occurred"));

  Widget _buildLoadingState() => const Center(child: CircularProgressIndicator());

  Widget _buildItemsListPage(BuildContext context, OrganizerItems<T> items) {
    return Column(
      children: [
        if (items.isEmpty)
          Center(child: Text('No Available'))
        else
          LinkItemListViewPage<T>(itemList: items),
        ElevatedButton(
          onPressed: () =>
              context.pushNamed(TaskRouterNames.taskUpdateUserRouteName, extra: params.id),
          child: Text('Update'),
        ),
      ],
    );
  }
}
